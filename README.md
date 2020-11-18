# Revelation inside Docker

This is a simple Docker image and accompanying launcher script to run [Revelation].

The motivation for this is the removal of Revelation from Debian Buster, for those of use that would like to keep using this seemingly abandoned but very functional password manager.

Please note this is mostly a hack, I'll try to make it work more seamlessly but for the time being it just works.

## Running / Installing

You must first have Docker installed and ready, and also be able to run it under your account.

The script will run Revelation using your host's username and home directory.

Launch Revelation with:

`$ ./revelation-docker.mk`

Alternatively you may install the script systemwide for easier launching:

1. Install the script to `/usr/local/bin` with:\
\
`$ sudo ./revelation-docker.mk install`

2. Launch Revelation with the script installed:\
\
`$ revelation-docker`

Uninstall with:

`$ sudo ./revelation-docker.mk uninstall`

### Open file automatically

`$ ./revelation-docker.mk FILE=passwords.revelation`

## Building the image for other architectures

As of this writing Docker Hub only contains an `amd64` image, for other architectures you'll have to build a local image:

1. Clone the repository:\
`git clone https://github.com/outlyer-net/docker-revelation.git`
2. Build the image locally:\
`./revelation-docker.mk build`

[revelation]: https://revelation.olasagasti.info/
