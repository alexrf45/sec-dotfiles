#zshrc config
# Author: Sean Fontaine
# Email: alex_r0land@pm.me

#history config
HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob

#turn off beep 
unsetopt beep
#vi key bindings
bindkey -v

#source aliases and env
source "$HOME/.zprofile"
source "$HOME/.zsh/aliases.zsh"

fpath=(/tmp/zsh-completions/src $fpath)

#displays saying in every new prompt
#cowsay $(fortune)

figlet -f slant "r0land" | lolcat

#persistant ssh agent
eval $(ssh-agent) > /dev/null

ssh-add ~/.ssh/bug &> /dev/null

#history log function
    precmd() { eval 'if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history -f)" >> ~/.logs/zsh-history-$(date "+%Y-%m-%d").log; fi' }

eval "$(starship init zsh)"

#miniplug zsh
source "$HOME/.zsh/plugins/miniplug.zsh"

# Define a plugin
miniplug plugin 'zsh-users/zsh-syntax-highlighting'
miniplug plugin 'zsh-users/zsh-autosuggestions'
miniplug plugin 'jameshgrn/zshnotes'
# Define a theme
#miniplug theme 'dracula/zsh'
# Source plugins
miniplug load

#bash-completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

#aws autocompletion
complete -C '/usr/local/bin/aws_completer' aws

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m 2> /dev/null
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

impacket() {
 dirname=${PWD##*/}
 docker run -it --rm \
 --net=host \
 -v `pwd`:/${dirname} \
 -e DOMAIN=$DOMAIN \
 -e IP=$IP \
 -w /${dirname} \
 impacket:latest
}

function kali() {
	dirname=${PWD##*/}
	if [ ! -d `pwd`/.kali-logs ];
	then
    mkdir .kali-logs && \
    docker run --name $NAME -it \
    --net=host --entrypoint=/bin/zsh \
		--cap-add=NET_ADMIN \
    -v $HOME/.Xauthority:/root/.Xauthority:ro -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
		-e NAME=$NAME \
		-e TARGET=$TARGET \
		-e IP=$IP \
		-e DOMAIN=$DOMAIN \
    -e TZ=America/New_York \
    -v `pwd`/.kali-logs:/root/.logs:rw -v `pwd`:/${dirname} \
    -w /${dirname} fonalex45/katet:latest
	else
		docker run --name $NAME -it \
		--net=host --entrypoint=/bin/zsh \
		--cap-add=NET_ADMIN \
		-v $HOME/.Xauthority:/root/.Xauthority:ro -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
		-e NAME=$NAME \
		-e TARGET=$TARGET \
		-e IP=$IP \
		-e DOMAIN=$DOMAIN \
    -e TZ=America/New_York \
		-v `pwd`/.kali-logs:/root/.logs:rw -v `pwd`:/${dirname} \
		-w /${dirname} fonalex45/katet:latest
	fi
}

function enter-kali() {
	docker exec -it $NAME /bin/zsh
}

function start-kali ()
{
 docker container start $NAME
}

function stop-kali() {
	docker container stop $NAME
}

function destroy-kali() {
	docker container rm $NAME
}


export NVM_DIR="$HOME/.config/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
