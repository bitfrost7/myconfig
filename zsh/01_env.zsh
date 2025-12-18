# =======================================================
# 01_env.zsh: 环境变量和 PATH 设置
# =======================================================

# --- 1. 环境变量 配置 ---
GOPATH="$HOME/.local/share/go"
NVM_DIR="$HOME/.nvm"
GEM_PATH=".local/share/gem/ruby/3.4.0"

CODE_COMPANION_KEY="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"

# --- 2. PATH 配置 (Zsh Array) ---
typeset -aU path

# 定义 PATH 数组，并自动更新 PATH 字符串
path=(
    $HOME/bin
    /usr/local/bin
    $GOPATH/bin
    $GEM_PATH/bin
    $path
)
export PATH # 确保 PATH 变量在整个 shell 会话中可用

# --- 3. 其他配置 ---
export GOPATH
export NVM_DIR
export CODE_COMPANION_KEY
