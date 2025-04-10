## Modifying the base RHELAI image

Method based on [this](https://github.com/larsks/moc-bootc-rhelai-nvidia) repo. 



Login to registry service account using podman


`https://access.redhat.com/terms-based-registry/accounts`


`sudo podman login registry.redhat.io` or `sudo podman login -u='<username' - <token> registry.redhat.io `


Need to start a registry


`sudo podman container run -dt -p 5000:5000 --name registry docker.io/library/registry:2`


and add to `/etc/containers/registries.conf`


```
[[registry]]
location = "localhost:5000"
insecure = true

```

Reload podman


`sudo systemctl restart podman`


Build image 


`sudo podman build -t localhost:5000/moc-roce-rhelai-nvidia:1.4 .`


push to local registry


`sudo podman push localhost:5000/moc-roce-rhelai-nvidia:1.4`


test it (optional)

`sudo podman run --rm -it --device nvidia.com/gpu=all --security-opt=label=disable --entrypoint /bin/bash --privileged --network host --name node --shm-size 10.24g localhost:5000/moc-roce-rhelai-nvidia:1.4`


And then switch


`sudo bootc switch localhost:5000/moc-roce-rhelai-nvidia:1.4`


Finally, reboot



Next, we'll setup the environment variable. Add the following to the bash script



```bash
# The following two IPs are the statically assigned ones for the ssh interface
export MY_IP=<IPV4_ADDRESS of HOST SSH_INTERFACE>
export REMOTE_IP=<IPV4_ADDRESS of REMOTE SSH_INTERFACE>
# The following two IPs are for the link local interface
export ROCE_MY_IP=<IPV4_ADDRESS of HOST ROCE_INTERFACE>
export ROCE_REMOTE_IP=<IPV4_ADDRESS of REMOTE ROCE_INTERFACE>
# Define NCCL variables
export NCCL_SOCKET_IFNAME=eno7np0  # name of the ROCE interface
export NCCL_IB_HCA=mlx5_5 # adapter name of the ROCE interface - use the `rdma link` to determine if unknown
export NCCL_IB_DISABLE='0' # use RoCE instead of TCP
export MASTER_PORT="29500" # pick the port used for RoCE traffic
export MASTER_ADDR="169.254.87.44" # pick the IP of the link local interface of the head node
export NCCL_IB_GID_INDEX=3 # use RoCE v2 and IPv4-mapped IPv6 addressing
```


set up ssh keys (needed for mpi)

`ssh-keygen -t rsa -b 4096`


`ssh-copy-id -i /home/$USER/.ssh/id_rsa.pub $USER@$ROCE_REMOTE_IP`


Check if `libibverbs-utils` has been correctly installed by running `ibv_devices` - this is needed by nccl for RoCE, else it'll try using TCP.


