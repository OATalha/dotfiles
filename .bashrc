# setup ssh-agent
LINES=$(ps aux | grep ssh-agent | wc -l)
PPKDIR=~/.ssh/keys
PATTERN="\.pub$"
if [ "2" -gt $LINES ] ; then
    ssh-agent -s > ~/.ssh-env-vars
    . ~/.ssh-env-vars
    for key in $(ls $PPKDIR) ; do
        # Add only private keys to ssh-agent
        if [[ ! $key =~ $PATTERN ]]; then
            ssh-add $PPKDIR/$key
        fi
    done
else
    . ~/.ssh-env-vars
fi

set -o vi

source scl_source enable devtoolset-7
source scl_source enable llvm-toolset-7

pathprepend() {
  for ((i=$#; i>0; i--)); 
  do
    ARG=${!i}
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

export USERNAME=$(whoami)

pathprepend $HOME/.local/bin/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias myconda="$HOME/Software/miniconda/bin/conda"
alias mypython="$HOME/Software/Python-3.9.14/bin/python3.9"

export VIRTUALENVWRAPPER_PYTHON="$HOME/Software/Python-3.9.14/bin/python3.9"
if [ -f "$HOME/.local/bin/virtualenvwrapper_lazy.sh" ]; then
    . "$HOME/.local/bin/virtualenvwrapper_lazy.sh"
fi

export oa_ppl1=/Volumes/rnd/oa_pipeline
export oa_ppl2=/Volumes/rnd/oa_pipeline.v2
export oa_ppl=/Volumes/rnd/oa_pipeline.v2

export ta_ppl="$oa_ppl/packages/dev/talha.ahmed"
export hs_ppl="$oa_ppl/packages/dev/heorhi.samushyia"
export jj_ppl="$oa_ppl/packages/dev/jagadeesh.jayakumar"
export rb_ppl="$oa_ppl/packages/dev/raju.buddha"

export ta_dev="$oa_ppl/development/talha.ahmed/"
export hs_dev="$oa_ppl/development/heorhi.samushyia/"
export jj_dev="$oa_ppl/development/jagadeesh.jayakumar/"
export rb_dev="$oa_ppl/development/raju.buddha/"

export ws_root=/Volumes/data/tahmed

alias oa_activate1="$oa_ppl1/activate"
alias oa_activate2="$oa_ppl2/activate"
alias oa_activate="$oa_ppl/activate"

alias ta_activate="$ta_ppl/activate"
alias hs_activate="$hs_ppl/activate"
alias jj_activate="$jj_ppl/activate"
alias rb_activate="$rb_ppl/activate"


##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /Volumes/profiles/tahmed/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /Volumes/profiles/tahmed/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /Volumes/profiles/tahmed/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /Volumes/profiles/tahmed/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /Volumes/profiles/tahmed/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /Volumes/profiles/tahmed/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /Volumes/profiles/tahmed/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /Volumes/profiles/tahmed/.config/synth-shell/better-history.sh
fi
. "$HOME/.cargo/env"
