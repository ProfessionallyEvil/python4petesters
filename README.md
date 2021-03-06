# Python4PEPentesters
This is the Python for Professionally Evil Pentesters class project.  It includes a vagrant VM that will run on a Oracle VirtualBox provider.  Though this environment is not strictly required to run the exercises in the class, it makes for a more consistent student experience.

## Setup

### Step 1: Clone this repo
Clone this repo and change directories into it.  To accomplish this, open a command console and change to the parent directory for this project (e.g. this might be a projects folder).  Then, assuming you have git installed, type the following:
```
git clone https://github.com/ProfessionallyEvil/Python4PEPentesters.git
cd Python4PEPentesters
```
Do not close your command console, as you will need it for more steps.

### Step 2: Clone the exercises
The classroom environment requires exercises before it will work.  These are maintained in a separate github repository and are not configured as a git submodule so that they can be more easily updated within the Vagrant guest.  Using your command console, clone the exercises folder as follows:
```
git clone https://github.com/ProfessionallyEvil/Python4PEPentesters-exercises.git exercises
```

The exercises folder will be mapped to the guest path `/home/vagrant/exerices`.

### Step 3: Install Vagrant
If you have not already done so, install [Vagrant](https://www.vagrantup.com/).  This will also require Oracle VirtualBox so that you have a virtual machine.

### Step 4: Run Vagrant
From your command prompt, type simply:
```vagrant up```

Note that this may take several minutes and may even appear to hang without feedback for several minutes, especially if you are working with low bandwidth while the basebox virtual machine is downloaded and configured for the first time.  The desktop will be visible before it is ready. **Important: wait until the vagrant command completes before interacting with it!**

If you see an error that looks like this: `The host path of the shared folder is missing: ./exercises`, go back to step 2.

## Logging In
The main user in the system is the Vagrant user, with home directory `/home/vagrant` and password "python"
