## Initial machine setup and validation


### Topology


### Machine specific configuration parameters
```bash
IPV4_ADDRESS
IPV4_GATEWAY
IPV4_DNS
SSH_INTERFACE
ROCE_INTERFACE
HOST_NAME
```

### Verifying Infiniband drivers
```bash
[ahmed@MOC-R4PCC04U36 ~]$ lsmod | grep "mlx"
mlx5_ib               495616  0
ib_uverbs             204800  1 mlx5_ib
ib_core               528384  2 ib_uverbs,mlx5_ib
mlx5_core            2469888  1 mlx5_ib
mlxfw                  45056  1 mlx5_core
psample                20480  1 mlx5_core
tls                   159744  1 mlx5_core
pci_hyperv_intf        16384  1 mlx5_core
```

```bash
[ahmed@MOC-R4PCC04U36 ~]$ rdma link
link mlx5_0/1 state DOWN physical_state DISABLED netdev eno2np0 
link mlx5_1/1 state DOWN physical_state DISABLED netdev eno3np1 
link mlx5_2/1 state ACTIVE physical_state LINK_UP netdev eno6np0 
link mlx5_3/1 state ACTIVE physical_state LINK_UP netdev eno5np0 
link mlx5_4/1 state ACTIVE physical_state LINK_UP netdev eno8np0 
link mlx5_5/1 state ACTIVE physical_state LINK_UP netdev eno7np0 
```