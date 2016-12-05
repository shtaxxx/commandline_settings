Command-line Settings
================================================================================

A Toolkit for Setting Up Command-line Environments on Linux/BSD/Mac.

Copyright (C) 2014, Shinya Takamaeda-Yamazaki

E-mail: takamaeda\_at\_ist.hokudai.ac.jp


What's This?
==============================

This is a setup toolkit for linux/BSD/MacOS command-line environments. The toolkit includes

- shell settings: .cshrc and .bashrc
- screen settings: .screenrc
- emacs settings: .emacs.d
- ssh port forwarding script: script/pf.rb
- ssh public key authorization and ssh-agent setup: .ssh/id_rsa,id_rsa.pub,authorized_keys

Procedure
================================================================================

Backup old setting files
----------------------------------------

If there are any old settings files, such as .bashrc, .bash_profile, .cshrc, and etc., rename or delete them.

    mv .bash_profile .bash_profile.old
    mv .bashrc .bashrc.old
    mv .cshrc .cshrc.old
    mv .emacs.d .emacs.d.old


Extract this project
----------------------------------------

    git pull https://github.com/shtaxxx/commandline_settings.git
    mv commandline_settings .settings
    

Make symbolic links by using setup_linux.sh
----------------------------------------

In settings, there is setup_linux.sh (and setup_mac.sh). 

It makes setting files of .bashrc, .cshrc, .screenrc, and .emacs.d on your home directory.

Please copy it from settings to ~/ and execute it.

    cp ~/settings/setup_linux.sh ~/
    sh setup_linux.sh


Setup ssh public key authorization and ssh-agent
----------------------------------------

ssh is a fundamental command to to access to linux/BSD servers.

Additionally, by using ssh-agent, you can skip an input of your password for every authorization, so that you are automatically authorized.

If you DON'T have a valid ssh public and secret keys, please execute the next command as below.

     sh settings/ssh_setup.sh

You will be asked the location of id_rsa, pass phrase, and pass phrase again.
Please type enter, a new pass phrase, and the pass phrase again.

Then you will have some new files in .ssh id_rsa, id_rsa.pub, and authorsized_keys.

### Sharing id_rsa on another machine

If you want to use id_rsa and id_rsa.pub on another machine, please copy id_rsa to .ssh on the machine VERY carefully.
Then set the permission of .ssh/id_rsa to 600

     chmod 600 .ssh/id_rsa


Source .bashrc/.cshrc
----------------------------------------

First check your shell.

    echo $SHELL

if your shell is bash, source .bashrc.

    source .bashrc

If your shell is tcsh, source .cshrc

    source .cshrc

Then you will be asked your pass phrase for ssh-agent. Please type your ssh pass phrase.
