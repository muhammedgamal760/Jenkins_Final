bastion=`terraform output -json bastion_ip | tr -d '"'`
private=`terraform output -json private_ip | tr -d '"'`

cat private.pem > ~/.ssh/mykey.pem
chmod 600 ~/.ssh/mykey.pem

cat << EOF > /root/.ssh/config 
Host *
      Port 22
      StrictHostKeyChecking no
      UserKnownHostsFile /dev/null
      ServerAliveInterval 60
      ServerAliveCountMax 30

host bastion
      HostName ${bastion}
      User ubuntu
      identityFile ~/.ssh/mykey.pem

host private_instance
      HostName ${private}
      user ubuntu
      ProxyCommand ssh bastion -W %h:%p
      identityFile ~/.ssh/mykey.pem
EOF


