---
title: GitHub_page网站搭建
description: >-
  在用jekyll-theme-chirpy搭建网站的过程中，遇到的问题，简单记录下来。
author: 尼爹
date: 2024-10-25 13:25:32 +0800
categories: [网络相关]
tags: [网站建设,jekyll,github]
image:
  path: /assets/img/posts/2024-10-25/GitHub_page网站搭建.png
---

# 安装配置 jekyll-theme-chirpy 遇到的问题

[![Static Badge](https://img.shields.io/badge/尼爹-博客-green)](https://xianlilun.github.io)

在安装和配置[jekyll-theme-chirpy ](https://github.com/cotes2020/jekyll-theme-chirpy)主题时，我遇到了一些问题，记录如下：

## 1. Git 子模块问题
在项目中，`assets/lib` 使用了 Git 子模块。我不想使用子模块，而希望将其本地化。

**解决方案：**

- 使用以下命令移除子模块的缓存：
  ```bash
  git rm --cached assets/lib

- 然后删除本地的子模块文件夹：

  ```bash
  git rm -rf assets/lib
  ```

## 2. 上传本地化的 `lib`

在将本地化的 `lib` 上传到 GitHub 后，发现仍然显示为嵌入式 Git 仓库。

**解决方案：**

- 确保本地化的 lib文件夹不被 Git 视为子模块。使用以下命令添加本地文件：

  ```
  git add assets/lib
  ```

## 3. CDN 加载问题

CDN缓存，我用的是https://cdn.jsdelivr.net。配置 `_config.yml` 中的 `assets.self_host.enabled` 为 `true` 后，图片仍然通过 CDN 加载。

**解决方案：**

- 确保正确设置 `assets.self_host` 和 `cdn` 的相关配置。
- 修改 `default.html` 中的 JS 加载逻辑，以确保使用本地化的 JS。

## 4. JavaScript 加载顺序

在 `default.html` 中使用了 `js-selector.html` 进行 JS 加载，但发现加载的 JS 文件可能与本地化的冲突。

**解决方案：**

- 检查 `js-selector.html` 中的 URL 是否指向了本地化的文件。
- 确保没有重复引用同一个 JS 库。

## 5. GoatCounter 数据统计

在设置 GoatCounter 后，访问数量始终显示为 1，怀疑未成功设置。

**解决方案：**

- 确保在网页中正确嵌入 GoatCounter 的代码，并检查是否在 GoatCounter 后台正确配置。

## 6. Google Analytics ID 设置

在 `analytics` 部分中填写 Google Analytics ID 时，不确定使用哪一个 ID，但是因为网站加载问题，最终废弃。

**解决方案：**

- 在 google 部分填写 GA4 的衡量 ID，例如：

  ```
    id: G-TS1xxxxxxx
  ```

## 7. 资源加载问题

对比 CDN 加速的资源与本地化的 JS，不确定哪种方式更快。

**解决方案：**

- 在网页中测试加载速度，比较两者的加载性能。

## 8. count.js 的问题 

- **问题**: 加载 `count.js` 导致网站分析错误，会导致访问页面缓慢，目录跳转无反应，需要等count.js加载30s才终止。 
- **解决方法**: 最终通过关闭网站分析功能解决了该问题，网页访问飞快。

<!-- 注释掉了GoatCounter.html,访问网站便不再加载 count.js-->    

<script
  async
  src="https://gc.zgo.at/count.js"
  data-goatcounter="https://{{ site.analytics.goatcounter.id }}.goatcounter.com/count"
></script>

## 9.POSTS页面标题及图片加载问题

采用的是相对路径，/assets/img/posts/，去掉了../assets/img/posts/前面的..,因为CDN加速时，无法识别。

```markdown
---
title: 文章标题
date: 2024-10-20 14:34:59 +0800
description: "文章描述"
tags: [标签, 标签1]
author: 作者
image:
  path: /assets/img/posts/2024-10-20/xxxx.jpg
categories: [分类]
---
```

## 10.中文主题设置

在_config.yml中lang: zh-CN即可，要想自定义翻译\_data\locales找到zh-CN.yml，按自己喜欢更改。

## 11.其他

侧边底部的联系方式，在_data\contact.yml更改。

博客底部分享链接，在_data\share.yml更改。

