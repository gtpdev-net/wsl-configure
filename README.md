# wsl-configure
A collection of scripts for setting up an Ubuntu WSL distro with common tools and session configuration.

## Setup

Clone this repository into your user's home directory (i.e.: `~`) in an Ubuntu WSL distro.

Add the following to the end of your session script (`.bashrc`, `.zshrc`, etc.)
```source ~/wsl-configure/scripts/session.sh```

### Docker
There is a setup script for installing the Docker engine; use the following command to launch it:
```$ sudo ./scripts/setup/docker/install.sh```

You can remove the installation using the following script:
```$ sudo ./scripts/setup/docker/uninstall.sh```
