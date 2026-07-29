# VDisk

VDisk is a developmental, architecture-independent virtual disk service intended for the Foundry virtual machine hosting ecosystem.

This repository currently contains only a lightweight Docker shim. It does not implement or test a storage API, guest ABI, block protocol, disk format, or connection to VVdisk.

Its current purpose is simply to establish:

- the repository;
- the project name;
- a buildable Docker image;
- a runnable container;
- a versioned starting point;
- and a place for later VDisk development.

## Current status

**Shim only — version 0.0.1**

The container starts, prints its identity and version, remains running, and exits cleanly when stopped.

No ports, volumes, devices, or external services are required.

## Build

```sh
make build
```

Or:

```sh
docker build -t vdisk:0.0.1 .
```

## Run

```sh
make run
```

Expected output:

```text
VDisk shim version 0.0.1
status: running
note: no API, ABI, or storage implementation is present
```

## Docker Compose

```sh
make up
make logs
make down
```

## Planned direction

VDisk is intended to become the architecture-independent virtual storage layer used by Foundry-hosted virtual machines.

A future implementation may connect VDisk to the VVdisk facilities in `r32lib`, while keeping guest architecture concerns outside the storage service.

Those interfaces are intentionally not defined by this shim.

## Author

Thomas Hamilton

## License

MIT License. See `LICENSE`.
