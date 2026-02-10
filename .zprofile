if ! ps -ef | grep "[s]sh-agent" &>/dev/null; then
  echo Starting SSH Agent
  eval $(ssh-agent -s)
fi

EDITOR=vi;     export EDITOR
PAGER=less;    export PAGER

export SAL_USE_VCLPLUGIN=qt5
export QT_STYLE_OVERRIDE=Breeze
export QT_QPA_PLATFORM=wayland
