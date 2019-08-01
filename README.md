Commandline Settings
================================================================================

A Toolkit for Setting Up Command-line Environments on Mac and Linux.

Copyright (C) 2016, Shinya Takamaeda-Yamazaki

E-mail: takamaeda\_at\_ist.hokudai.ac.jp


What's This?
==============================

This is a setup toolkit for Mac and Linux command-line environments. The toolkit includes

- shell settings: (for bash) .bash_profile and .bashrc, (for zsh) .zprofile and .zshrc
- screen settings: .screenrc
- emacs settings: .emacs.d
- vim settings: .vimrc
- ssh public key authorization and ssh-agent setup: .ssh/id_rsa,id_rsa.pub,authorized_keys


Procedure
================================================================================

Backup old setting files (if needed)
----------------------------------------

If there are any old settings files, such as .bashrc and .bash_profile, please rename or delete them.

    mv .bash_profile .bash_profile.old
    mv .bashrc .bashrc.old
    mv .zprofile .zprofile.old
    mv .zshrc .zshrc.old
    mv .emacs.d .emacs.d.old
    mv .vimrc .vimrc.old


Extract this project
----------------------------------------

    cd
    git clone https://github.com/shtaxxx/commandline_settings.git
    mv commandline_settings .dotfiles
    

Make symbolic links by using setup.sh
----------------------------------------

It makes setting files of .bashrc, .screenrc, and .emacs.d on your home directory.

Please copy it from settings to ~/ and execute it.

    cd
    cp ~/.dotfiles/setup.sh ~/
    sh setup.sh
    rm -f setup.sh


Setup ssh public key authorization and ssh-agent
----------------------------------------

ssh is a fundamental command to to access to linux/BSD servers.

Additionally, by using ssh-agent, you can skip an input of your password for every authorization, so that you are automatically authorized.

If you DON'T have a valid ssh public and secret keys, please execute the next command as below.

    cd
    cp ~/.dotfiles/ssh_setup.sh ~/
    sh ssh_setup.sh
    rm -f ssh_setup.sh

You will be asked the location of id_rsa, pass phrase, and pass phrase again.
Please type enter, a new pass phrase, and the pass phrase again.

Then you will have some new files in .ssh id_rsa, id_rsa.pub, and authorsized_keys.

### Sharing id_rsa on another machine

If you want to use id_rsa and id_rsa.pub on another machine, please copy id_rsa to .ssh on the machine VERY carefully.
Then set the permission of .ssh/id_rsa to 600

    cd
    chmod 600 .ssh/id_rsa


Option: How to update this repository to latest version
----------------------------------------

    cd .dotfiles
    git pull
