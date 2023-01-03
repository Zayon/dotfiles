# True color support for *nix system
# set -x TERM xterm-256color

source ~/.profile

# export CLOUDSDK_PYTHON=(which python3)

set --global tide_right_prompt_items status cmd_duration context jobs
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# export AGICAP_DOCKER_DIR="$HOME/Documents/dev/agicap/agicap-docker-compose/dev-stack"
# pyenv
# status is-login; and pyenv init --path | source
# status is-interactive; and pyenv init - | source

# Rust cargo
export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/go/bin"
export PATH="$GOPATH:$PATH"

#zoxide init fish | source

#-------------------------------------------------------------------------------
# SSH Agent
#-------------------------------------------------------------------------------
function __ssh_agent_is_started -d "check if ssh agent is already started"
	if begin; test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"; end
		source $SSH_ENV > /dev/null
	end

	if begin; test -z "$SSH_AGENT_PID"; and test -z "$SSH_CONNECTION"; end
		return 1
	end

	ssh-add -l > /dev/null 2>&1
	if test $status -eq 2
		return 1
	end
end

function __ssh_agent_start -d "start a new ssh agent"
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    chmod 600 $SSH_ENV
    source $SSH_ENV > /dev/null
    ssh-add
end

if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/pablogodinez/google-cloud-sdk/path.fish.inc' ]; . '/Users/pablogodinez/google-cloud-sdk/path.fish.inc'; end
