# =======================================================
# 01_env.zsh: 环境变量和 PATH 设置
# =======================================================

# --- 1. SDK 初始化 ---
export GOPATH="${GOSDK}/gopath"
export NODE_SDK="${SDK_PATH}/node-v22.19.0"

# 初始化 GOROOT (默认1.18)
if [ -z "$GOROOT" ]; then
    export GOROOT="${GOSDK}/go1.18.10" 
fi

# --- 2. PATH 配置 (Zsh Array) ---
typeset -aU path

# 定义 PATH 数组，并自动更新 PATH 字符串
path=(
    $HOME/bin
    /usr/local/bin
    /opt/homebrew/bin
    $GOROOT/bin         # 必须包含 GOROOT/bin
    $GOPATH/bin         # 必须包含 GOPATH/bin
    $NODE_SDK/bin
    $TOOL_PATH/bin
    $path
)
export PATH # 确保 PATH 变量在整个 shell 会话中可用

# --- 3. 其他配置 ---
# Flutter 配置
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
