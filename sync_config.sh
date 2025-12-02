#!/bin/bash

# =======================================================
# 配置文件备份同步脚本 (sync_configs.sh)
# -------------------------------------------------------
# 功能：将指定的用户配置目录和文件备份到脚本所在的目录。
# 工具：使用 rsync 实现高效同步和增量备份。
# =======================================================

# --- 颜色定义 ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# --- 1. 定义源配置路径 (核心配置区) ---
# 格式：相对路径或绝对路径。通常位于 $HOME 或 $HOME/.config/
# 您可以在这里添加或修改任何您想备份的目录或文件。
# 注意：路径必须是完整的文件名或目录名。

CONFIGS_TO_SYNC=(
    # Neovim 配置目录
    "$HOME/.config/nvim"
    # Zsh 配置文件
    "$HOME/.zshrc"
    "$HOME/.config/zsh"
    # Alacritty 终端配置目录
    "$HOME/.config/alacritty"
    # i3 窗口管理器配置 
    "$HOME/.config/i3"
    # Picom 窗口合成器配置
    "$HOME/.config/picom"
    # polybar 配置
    "$HOME/.config/polybar"
    # rofi 配置
    "$HOME/.config/rofi"
)

# --- 2. 目标目录设置 ---
# 将配置备份到脚本所在的目录
DEST_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo -e "${YELLOW}====================================================${NC}"
echo -e "${YELLOW}🚀 开始同步配置到目标目录: ${DEST_DIR}${NC}"
echo -e "${YELLOW}====================================================${NC}"

# --- 3. 循环同步逻辑 ---
SYNC_COUNT=0
SKIP_COUNT=0

for SOURCE_PATH in "${CONFIGS_TO_SYNC[@]}"; do
    # 获取文件名或目录名 (用于作为目标备份项的名称)
    ITEM_NAME=$(basename "$SOURCE_PATH")
    
    if [ -e "$SOURCE_PATH" ]; then
        echo -e "\n${GREEN}[SYNCING]${NC} ${ITEM_NAME}"
        
        # 使用 rsync 进行同步备份
        # -a: 归档模式，保留权限和时间戳，递归复制
        # -v: 详细输出
        # --delete: 删除目标目录中源目录没有的文件 (保持同步)
        
        rsync -av --delete "$SOURCE_PATH" "$DEST_DIR"
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ 成功同步: ${ITEM_NAME}${NC}"
            SYNC_COUNT=$((SYNC_COUNT + 1))
        else
            echo -e "${RED}❌ 同步失败: ${ITEM_NAME}${NC}"
            SKIP_COUNT=$((SKIP_COUNT + 1))
        fi
    else
        echo -e "${YELLOW}⚠️ 跳过 (未找到): ${ITEM_NAME} (路径: $SOURCE_PATH)${NC}"
        SKIP_COUNT=$((SKIP_COUNT + 1))
    fi
done

# --- 4. 总结 ---
echo -e "\n${YELLOW}====================================================${NC}"
echo -e "${GREEN}同步完成!${NC} 成功同步 ${GREEN}${SYNC_COUNT}${NC} 个项目，跳过 ${YELLOW}${SKIP_COUNT}${NC} 个项目。"
echo -e "${YELLOW}====================================================${NC}"

exit 0
