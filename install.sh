# clone repo
USER_NAME=Chun-Yang
if [ -d ~/.tmux-config ]
then
  echo "[INFO] tmux-config is installed, updating now..."
  git -C ~/.tmux-config pull git@github.com:${USER_NAME}/tmux-config.git
else
  echo "[INFO] tmux-config is not installed, installing tmux-config..."
  git clone https://github.com/${USER_NAME}/tmux-config ~/.tmux-config
fi

link_file() {
  if [ -e $2 ]
  then
    if [ "`readlink $2`" != "`ls $1`" ]
    then
      echo "[INFO] existing $2 file is moved to $2.backup"
      mv $2 $2.backup
      echo "[INFO] link $1 to $2"
      ln -s $1 $2
    fi
  else
    echo "[INFO] link $1 to $2"
    ln -sf $1 $2
  fi
}

# link .tmux.conf file
link_file ~/.tmux-config/.tmux.conf ~/.tmux.conf

# link .tmuxinator/default.yml
link_file ~/.tmux-config/tmuxinator/default.yml ~/.tmuxinator/default.yml

echo "[STATUS] SUCCESS"
