**写在前面：本项目根据[the-mvm](https://github.com/the-mvm)大佬的[the-mvm.github.io](https://github.com/the-mvm/the-mvm.github.io)项目改动而来，感谢开源项目带给我的快乐！**

## 尼爹再辞

欢迎访问我的个人博客！这是一个使用 Jekyll 构建的网站，记录我的学习和生活点滴。

## 目录

- [关于](#关于)
- [技术栈](#技术栈)
- [使用说明](#使用说明)
- [贡献](#贡献)
- [许可](#许可)

## 关于

这个博客主要用于分享我的学习记录、技术文章和生活感悟。希望能和大家一起成长，共同学习。

## 技术栈

- **Jekyll**：静态网站生成器
- **Markdown**：用于撰写文章
- **GitHub Pages**：托管网站的平台

## 使用说明

1. **克隆项目**：

```bash
git clone https://github.com/xianlilun/xianlilun.github.io.git
cd xianlilun.github.io
```

2**安装依赖**：

```bash
bundle install
```

3**运行本地服务器**：

```bash
bundle exec jekyll serve
```

访问 http://localhost:4000 查看网站。

4**创建新文章**： 使用 `bash 自动生成带时间md.sh` 脚本创建新文章，具体用法如下：

```bash
./bash 自动生成带时间md.sh "文章标题" "文章描述" "" "标签" "作者" "GitHub链接"
```

5**推送到仓库**： 创建或修改完文章后，使用以下命令将更改推送到 GitHub：

```bash
git add .
git commit -m "描述你的更改"
git push origin main  # 或者是 master，视你的仓库默认分支而定
```

## 贡献

欢迎提出建议和改进！如果你有想法或发现bug，可以提交[issue](https://github.com/xianlilun/xianlilun.github.io/issues)，反正我也不懂。

## 许可

本项目遵循 MIT 许可证。详情请查看 [LICENSE](LICENSE) 文件。

```
复制代码
你可以根据需要调整内容或格式。如果有特定的要求或者想加入其他信息，请不要告诉我，我是小白！
```