# PoCs
---
## Build `opscli` toolset image
---
```
$ cd opscli/
$ docker build --progress=plain --no-cache -t opscli .
# Do tests
$ docker run --rm -it opscli ansible --version
$ docker run --rm -it opscli nomad version
$ docker run --rm -it opscli packer version
$ docker run --rm -it opscli consul version
$ docker run --rm -it opscli terraform version
```