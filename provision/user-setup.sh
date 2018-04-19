cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
echo "GIT_PROMPT_ONLY_IN_REPO=1" >> .bashrc
echo "source ~/.bash-git-prompt/gitprompt.sh" >> .bashrc
