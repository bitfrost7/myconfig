# =======================================================
# ZSHRC 主入口
# -------------------------------------------------------

# --- 1. 核心路径 ---


# --- 2. 函数自动加载 (Autoload) ---
ZSH_FUNCTIONS_DIR="$HOME/.config/zsh/functions"

# 检查目录是否存在，并添加到 fpath
if [ -d "$ZSH_FUNCTIONS_DIR" ]; then
    fpath=("$ZSH_FUNCTIONS_DIR" $fpath)
fi

# 加载函数
autoload -Uz pb pc
 
# --- 3. 模块化加载 ---
source ~/.config/zsh/01_env.zsh
source ~/.config/zsh/02_aliases.zsh
source ~/.config/zsh/03_plugins.zsh
# 设置nvm
source /usr/share/nvm/nvm.sh
