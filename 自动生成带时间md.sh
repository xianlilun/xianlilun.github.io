#!/bin/bash
#  bash 自动生成带时间md.sh "机器学习简介" "这是一篇关于机器学习的文章。" "" "机器学习, Python" "张三" "zhangsan"   生成命令

# 检查参数数量
if [ "$#" -ne 6 ]; then
    echo "Usage: $0 TITLE DESCRIPTION IMG_PATH TAGS AUTHOR GITHUB"
    exit 1
fi

# 获取当前日期
DATE=$(date +"%Y-%m-%d %H:%M:%S -0800")
CURRENT_DATE=$(date +"%Y-%m-%d")
TITLE="$1"
DESCRIPTION="$2"
TAGS="$4"
AUTHOR="$5"
GITHUB="$6"

# 生成文件名
FILENAME=$(echo "$TITLE" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
FILENAME="_posts/${CURRENT_DATE}-${FILENAME}.md"

# 创建日期格式的文件夹
IMG_DIR="assets/img/posts/$CURRENT_DATE"
mkdir -p "$IMG_DIR"

# 将图片路径更新为新文件夹路径
IMG_PATH="${IMG_DIR}/$(basename "$3")"

# 移动图片到新文件夹（可选）
mv "$3" "$IMG_PATH"

# 创建 Markdown 文件并写入内容
{
    echo "---"
    echo "layout: post"
    echo "title: \"$TITLE\""
    echo "date: $DATE"
    echo "description: \"$DESCRIPTION\""
    echo "img: \"$IMG_PATH\""
    echo "tags: [$TAGS]"
    echo "author: \"$AUTHOR\""
    echo "github: \"$GITHUB\""
    echo "---"
} > "$FILENAME"

echo "Post created: $FILENAME"
echo "Image moved to: $IMG_PATH"
