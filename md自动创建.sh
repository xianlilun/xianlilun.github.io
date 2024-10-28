#!/bin/bash
# 运行格式   ./md自动创建.sh "标题" "描述" "分类" "标签"

# 获取今天的日期
TODAY=$(date +"%Y-%m-%d")
DIR="./assets/img/posts/$TODAY"

# 创建日期文件夹（如果不存在）
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    echo "已创建文件夹：$DIR"
else
    echo "文件夹已存在：$DIR"
fi

# 自定义变量
TITLE="$1"
DESCRIPTION="$2"
CATEGORIES="$3"
TAGS="$4"
AUTHOR="尼爹"

# 当前日期和时间
DATE=$(date +"%Y-%m-%d %H:%M:%S %z")

# Markdown 文件名
FILENAME="${TODAY}-${TITLE// /_}.md"
OUTPUT_PATH="./_posts/$FILENAME"

# Markdown 内容
cat <<EOL > "$OUTPUT_PATH"
---
title: "$TITLE"
description: >-
  $DESCRIPTION
author: $AUTHOR
date: $DATE
categories: [$CATEGORIES]
tags: [$TAGS]
image:
  path: /assets/img/posts/$TODAY/$TITLE.jpg
---

<!-- 文章内容 -->
EOL

echo "Markdown 文件 $FILENAME 已创建在 _posts 目录下。"
