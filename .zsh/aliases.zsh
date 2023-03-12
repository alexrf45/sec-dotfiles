
#arch commands
alias reload='. ~/.zshrc ; echo "ZSH reloaded!!"'
alias update='sudo pacman -Syyu'
alias i='sudo pacman -S'
alias vim='nvim'
alias tree-overview='tree -D -L 2'
alias history-backup='cp -r ~/.logs ~/dev-bckup/arch-history/ && rm ~/.logs/*'

#tmux
alias t='tmux new -f ~/.tmux.conf -s $1'
alias t-session='tmuxp load ~/.config/tmuxp/ctf.yaml'
#networking
alias public='curl wtfismyip.com/text'
alias http='sudo python3 -m http.server 80'

#aws-vault
alias awsv='aws-vault exec Administrator'
alias awsv-acct-admin='aws-vault exec account-admin --duration=2h'

#python
alias py='python3'

#ssh

#tor
alias tor='docker run --rm --detach --name tor --publish 9050:9050 tor:test'


#scripts
alias arch-mirror='~/.config/scripts/./arch-mirror.sh'
alias terraform-project='~/.config/scripts/./terraform-skel.sh $1'
alias dockershell='~/.config/scripts/./dockershell.sh'
alias ec2-list='~/.config/scripts/./ec2list.sh'
alias s3-create='python3 ~/.config/scripts/s3.py'
alias tf-project='~/.config/scripts/./terraform-skel.sh'

#terraform
alias tf='terraform'
alias tfa='terraform apply'
alias tfv='terraform validate'
alias tfp='terraform plan'
alias tfs='terraform state'
alias tfsls='terraform state list'
alias tfo='terraform output'
alias tfinit='terraform init'
alias tfd='terraform destroy'
alias tff='terraform fmt'

#aws cli aliases
alias ec2-check='aws ec2 describe-instances --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value,Type:InstanceType,Status:State.Name,VpcId:VpcId,Id:InstanceId}" --filters "Name=instance-state-name,Values=running" --output table'
alias s3-list="aws s3api list-buckets | jq -r '.Buckets[].Name'"
alias vpc-check='aws ec2 --output text --query "Vpcs[*].{VpcId:VpcId,Name:Tags[?Key=='Environment'].Value|[0],CidrBlock:CidrBlock}" describe-vpcs'
alias s3-delete='aws s3api delete-bucket --bucket ${BUCKET}'

#cloud-nuke aws
alias aws-nuke='cloud-nuke aws --exclude-resource-type s3 --exclude-resource-type iam --exclude-resource-type secretsmanager --exclude-resource-type dynamodb'
alias aws-nuke-view-us-east-1='cloud-nuke inspect-aws --region us-east-1'

#docker
alias dock='docker'
alias dockimls='docker image ls'
alias dockim='docker image'
alias prune-containers='docker container prune'
alias prune-images='docker image prune'
alias dockc='docker container'
alias dockps='docker ps'
alias docknt='docker network'


#docker compose
alias dockup='docker-compose up -d'
alias dockdown='docker-compose down'


alias secfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


#Juiceshop
alias juiceshop='docker run --name juiceshop -d --rm -p 3000:3000 bkimminich/juice-shop'

#CTF Aliases
alias endgame='sudo openvpn ~/.config/openvpn/endgame.ovpn'
alias htb='sudo openvpn ~/.config/openvpn/htb.ovpn'
alias htb-season='sudo openvpn ~/.config/openvpn/competitive.ovpn'
alias release='sudo openvpn ~/.config/openvpn/release.ovpn'
alias echoctf='sudo openvpn ~/.config/openvpn/echoCTF.ovpn'

#tools
alias ciphey='docker run -it --rm remnux/ciphey'
alias neo4j='docker-compose -f ~/tools/bloodhound-dev/docker-compose.yaml up -d'
alias neo4j-down='docker-compose -f ~/tools/bloodhound-dev/docker-compose.yaml down'
alias bloodhound='/usr/local/bin/bloodhound-linux/./BloodHound --no-sandbox &'
