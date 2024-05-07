Check https://github.com/johncolby/macOS-KVM/tree/master
Check https://khronokernel.com/apple/silicon/2021/01/17/QEMU-AS.html

```sh
$ wget https://github.com/acidanthera/OpenCorePkg/releases/download/0.9.7/OpenCore-0.9.7-DEBUG.zip
$ virt-install --name macos \
    --memory 8GB \
    --vcpus 2 \
```