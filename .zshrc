# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =======================================================
# ZSHRC 主入口
# -------------------------------------------------------

# --- 1. 核心路径 ---
TOOL_PATH="$HOME/Tools"
SDK_PATH="${TOOL_PATH}/sdk"
SCRIPT_PATH="${TOOL_PATH}/scripts"
# 定义 Go SDK 根目录
GOSDK="${SDK_PATH}/go"

# --- 2. 函数自动加载 (Autoload) ---
# 使用 $HOME 确保路径正确展开
ZSH_FUNCTIONS_DIR="$HOME/.config/zsh/functions"

# 检查目录是否存在，并添加到 fpath
if [ -d "$ZSH_FUNCTIONS_DIR" ]; then
    # 注意：fpath 数组中的元素必须是目录名
    fpath=("$ZSH_FUNCTIONS_DIR" $fpath)
fi

# 确保 gosw 函数在调用时被加载 (使用新的函数名)
autoload -Uz gosw

# --- 3. 模块化加载 ---
# 必须按顺序加载，env 优先
source ~/.config/zsh/01_env.zsh
source ~/.config/zsh/02_aliases.zsh
source ~/.config/zsh/03_plugins.zsh
# -------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
