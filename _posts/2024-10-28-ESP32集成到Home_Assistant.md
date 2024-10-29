---
title: "ESP32集成到Home Assistant"
description: >-
  之前整了个ESP32带wifi的一直闲置，最近心血来潮，想让它当网关，于是就有了本文章
author: 尼爹
date: 2024-10-28 21:19:28 +0800
categories: [物联网]
tags: [智能,自动化,esp32,网关,Home Assistant]
image:
  path: /assets/img/posts/2024-10-28/ESP32集成到Home Assistant.webp
---

## 前期准备
1. **安装 ESPHome**：

   - 在你的电脑上安装 ESPHome，可以通过命令行工具或在 Home Assistant 中使用，当然前提是你已经安装python，且会正确运用。
   - 然后使用以下命令安装 ESPHome：
     ```bash
     pip install esphome
     ```

2. **准备 ESP32**：
   - 确保你的 ESP32 开发板已经连接到电脑，并安装好驱动程序。

## 创建 ESPHome 配置
1. **创建配置文件**：
   - 在命令行中运行以下命令，创建新的配置文件（将 `<config_file>` 替换为你想要的文件名）：
     ```bash
     esphome wizard <config_file>.yaml  #比如esp32-device.yaml
     ```

2. **输入设备信息**：
   
   - 选择使用的微控制器类型（输入 `esp32dev` 对于 ESP32 开发板），可以看自己主板背面写的型号，比如esp32doit-devkit-v1 。
   - 输入你的 Wi-Fi 网络名称（SSID）和密码，以便esp32能通过wifi连上家里的局域网。
   
3. **配置 API**：
   
   - 在生成的 YAML 文件中，确保包含以下 API 配置：
     ```yaml
     api:
       password: "your_password"  # 可选，设置密码
     ```

## 上传固件
1. **通过 USB 上传固件**：
   
   - 在命令行中运行以下命令，将配置上传到 ESP32：
     ```bash
     esphome <config_file>.yaml run
     ```
   
2. **设置串口监视器**（可选）：
   - 使用串口监视器查看 ESP32 的状态，确认它已成功连接到 Wi-Fi。

## 集成到 Home Assistant
1. **获取 ESP32 的 IP 地址**：
   - 在你的路由器管理界面找到 ESP32 的 IP 地址，上传固件成功，命令窗口会显示你连接的信息，包括ESP32的局域网IP。

2. **在 Home Assistant 中添加 ESPHome 设备**：
   - 打开 Home Assistant 的界面。
   - 进入 **配置** > **集成**，点击右下角的 **添加集成**。
   - 搜索并选择 **ESPHome**。
   - 输入 ESP32 的 IP 地址和端口（默认是 `6053`，如果没有更改过端口）。

3. **完成集成**：
   - 点击提交，Home Assistant 会自动发现 ESP32 并添加到你的设备列表中。

## 后续步骤
- 根据需要，进一步自定义 ESPHome 配置文件，添加传感器或其他功能。
- 参考 ESPHome 文档，学习更多功能和配置选项。

## 参考链接
- [ESPHome 官方文档](https://esphome.io/)
- [Home Assistant 集成指南](https://www.home-assistant.io/integrations/esphome/)
