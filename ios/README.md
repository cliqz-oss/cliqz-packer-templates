# OS X templates for Packer 

This is a set of Packer templates and support scripts that will prepare an OS X installer media that performs an unattended install for use with [Packer](http://packer.io).

The machine built by this Packer template defaults to being configured for use with [Vagrant](http://www.vagrantup.com), and supports only one Vagrant providers by using Packer's respective builder:

- The [Hashicorp VMware Fusion provider](http://www.vagrantup.com/vmware) (recommended)


## Preparing the ISO
**Note:**
OS X's installer cannot be bootstrapped as easily as can Linux or Windows, and in current version it is not possible to run [prepare_iso.sh](https://github.com/timsutton/osx-vm-templates/blob/master/prepare_iso/prepare_iso.sh) script to perform modifications to it. [Related Issue](https://github.com/boxcutter/macos/issues/26)

## Use with Packer
Because of the issue i mentioned above, it is at this moment not possible to install Mac OS without attendance. So the process is separated to two parts. 
* First part is semi manual installation of the vanilla ISO of OS with VMware tools. 
* Second part is fully automated preparation of the installed image. 

### Creating a VMDK file
Basically, we need to run packer, fetch the port out of it's output and connect to machine via VNC. Obviously, as the machine is being built on a different server we will need to setup a SSH tunnel to it. 

```
cd packer-base
packer build -var-file variables.json template.json
```

Follow the instructions and continue to install the machine. Install the required Xcode Version Create a Vagrant user and group, and add it to admin group. Validate that the user can run passwordless sudo. Allow Remote login .
When the build finished, fetch the resulting VMX file. 

### Create a configured box
Now that we have our provisioned VM we need to install all the dependencies on it. Run the command, providing the source_path variable to the executable. 
```
cd packer
packer build -var-file variables.json -var 'source_path={{ PATH_TO_VMX }}' template.json
```

The output of this run will be the vagrant box we can use. 
