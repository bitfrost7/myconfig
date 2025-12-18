# =======================================================
# 03_plugins.zsh: Oh My Zsh & 插件加载
# =======================================================

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(
  # 内置插件
  git
	z
	sudo
	sublime
	vscode
	web-search
  extract

  # 外部插件
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
