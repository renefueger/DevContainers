#! /bin/bash
if [ ! -d /home/vscode/.ssh ]; then
  mkdir /home/vscode/.ssh
fi
cp -R /ssh-keys/* /home/vscode/.ssh
chown -R vscode:vscode /home/vscode/.ssh
chmod -R 700 /home/vscode/.ssh

eval "$(ssh-agent)"

shopt -s nullglob extglob
cd /home/vscode/.ssh
for f in !(*.pub|known_hosts)
do
	echo "ssh-add $f"
	ssh-add $f
done
