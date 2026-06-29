#!/bin/bash
cd "$(dirname "$0")"

echo "=================================="
echo "  🚀 家庭健身看板自动更新脚本"
echo "=================================="
echo ""

# 自动从 canvas 目录复制最新文件
SOURCE_FILE="/Users/xiaoxueyuan/.openclaw/canvas/fitness-dashboard.html"
TARGET_FILE="健身看板.html"

if [ -f "$SOURCE_FILE" ]; then
    echo "📥 正在复制最新文件..."
    cp "$SOURCE_FILE" "$TARGET_FILE"
    echo "✅ 文件已更新"
else
    echo "❌ 找不到源文件：$SOURCE_FILE"
    exit 1
fi

echo ""

# 提交并推送
echo "📤 正在更新到 GitHub..."
git add "$TARGET_FILE"
git commit -m "更新数据 $(date '+%Y-%m-%d %H:%M')"
git push

echo ""
echo "🎉 更新完成！"
echo "🌐 访问链接：https://xiaoxueyuan225.github.io/-/健身看板.html"
echo ""
read -p "按回车键退出..."
