if [ -e ~/.ssh ] ; then
    chmod 700 ~/.ssh
else
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
fi

ssh-keygen
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
