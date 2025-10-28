mixer -d5

if ! ps -ef | grep "[s]sh-agent" &>/dev/null; then
  echo Starting SSH Agent
  eval $(ssh-agent -s)
fi
