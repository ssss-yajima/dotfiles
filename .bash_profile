## .bash_profile

# shopt
shopt -s globstar

# .bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[34m\]\w\[\e[37m\]\[\e[0m\]\$(parse_git_branch)\[\033[00m\] $ "

# ========== Oracle =========
export ORACLE_HOME=~/lib/instantclient_19_3
export PATH=~/lib/instantclient_19_3:$PATH
export ORACLE_SID=orclepdb1
export LAMBDAKEY=UeVizakqDC8fyYJXEZTkx2eeZ4cZ1baj1vXWCSXy


# ========== Python =========
export PATH=/usr/local/bin:$PATH

# ========== GCP ============
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/syajima/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/syajima/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/syajima/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/syajima/Downloads/google-cloud-sdk/completion.bash.inc'; fi
