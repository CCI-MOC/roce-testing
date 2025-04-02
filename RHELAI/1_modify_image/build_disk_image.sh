sudo podman run   --rm   -it   --privileged   --pull=newer   --security-opt label=type:unconfined_t   -v "$PWD:/output"   -v /var/lib/containers/storage:/var/lib/containers/storage   "quay.io/centos-bootc/bootc-image-builder:latest"   --type qcow2   --local   localhost/moc-roce-rhelai-nvidia:1.4

