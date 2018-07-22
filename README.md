# SWGEmu Development Environment setup

****************************************************************************************************************
Special Thanks to lordkator for the initial FastTrack VM Image and the scripts that this repository is based on.
****************************************************************************************************************

VirtualBox, VMWare, or native install.

	8g mem
	32g virtual drive
	max cores
	bridged network

# Install Debian 9.x 64bit 
(or variant)
* Debian - https://www.debian.org/

## Add user to sudoers

### Login info
* username = $USER
* password = 
* root pw = 


# Import scripts

Copy this series of commands into a terminal: Installs git, downloads scripts and installs them.

	sudo apt-get update && sudo apt-get install -y -q git && mkdir DevEnv && cd DevEnv && git clone https://github.com/Scurby/DevEnv.git && cp -i ~/DevEnv/README.md ~/Documents && mkdir setup && cp -i ~/setup/* ~/setup/ && mkdir run && cp -r ~/DevEnv/run/* ~/run/ && chmod -v +x ~/DevEnv/bin/* && cat ~/DevEnv/bin/pathto &>> ~/.bashrc

## Run scripts

The following scripts are run from the command line. They are numbered in the order I use them.

1. reqd - Installs required packages and programs including Lua, BerkelyDB, and others.
2. setup - Setup of development environment follows these steps:
   * Choose editor
   * Setup git user.* config
   * Clone repos and checkout a local branch of Core3 origin/unstable
   * Symlinks (idlc)
   * Engine library
   * Server configuration
   * Tre files (They will need to be copied or moved)
   * Asks if you want to build and run the server.
3. build - simple build script
   * 3 options- build, build config, build clean
4. start - Builds and runs the development server.
   * Using this command to start the server will:
   * launches the server under gdb on a 'screen'.
   * outputs a screenlog to ~/run/screenlog*
   * use the config.lua in ~/run/conf/ to replace the config.lua in ~/MMOCoreORB/bin/conf.
   * uses gdb in batch mode and starts with the commands  in ~/run/run_gdb which you can change to your pleasing; (breakpoints, dumps, settings etc.)
5. devtools - Installs Optional packages including xclip, vim, and others.
6. latest - do a quick git-stash, git-pull, and git-stash-apply so you can get to the latest code w/o loosing local work.

### The following scripts are also useful...
* createdb - mysql table, user, and pwd tool.
  * Ref: (http://jetpackweb.com/blog/2009/07/20/bash-script-to-create-mysql-database-and-user/)
* myip -  display the ip of the VM and login port for quick configuration of the windows client.
* updateip - Get ip address of local eth0 and update galaxy table as needed.
* installed - Package and version check saved to /home/<file>.txt.

**************************************************************************************
#### FIXME's
* godmode - sets acct with ID=1 to Admin (15). Run after first acct is created.

**************************************************************************************
