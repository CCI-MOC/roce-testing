## Modifying the base RHELAI image


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


And then switch


`sudo bootc switch localhost:5000/moc-roce-rhelai-nvidia:1.4`


Finally, reboot


Set ulimit to unlimited


`sudo ulimit -l unlimited`