#!/bin/bash

cat <<EOF > "$HOME/.ssh/config"
# SSH over Session Manager
host i-* mi-*
    ProxyCommand sh -c "AWS_PROFILE=$1 aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"
EOF

echo "SSH config file has been updated."