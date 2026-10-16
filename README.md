[English](README.en.md)

# EvoVerse SDK 客户交付包

EvoVerse SDK 是面向 Efinix FPGA（Efinity 工具链）与 RK3588 嵌入式平台的 AI 驱动开发套件，以 Trae / VS Code 扩展形式交付：SDK 主扩展 + Efinity Adapter + RK3588 Adapter，配套文档门户、Agent Skills 与工具脚本。

本仓库同时提供**中文版**与**英文版**两套独立交付包，内容互不包含——按你的语言下载其中一个即可。

## 在线文档

下载前可先在线浏览，内容与交付包内一致：

- [中文文档门户](https://butonlyif.github.io/evoverse-sdk-releases/zh/customer-portal.html)
- [English Documentation Portal](https://butonlyif.github.io/evoverse-sdk-releases/en/customer-portal.html)

## 下载 v1.0.0

| 语言 | 交付包 | 大小 | SHA256（前 8 位） |
|------|--------|------|-------------------|
| 简体中文 | [EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz) | 6.76 MB | `4ACD3A7B` |
| English | [EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz) | 6.73 MB | `3A211457` |

- 完整校验值见 Release 附件 [SHA256SUMS-v1.0.0.txt](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/SHA256SUMS-v1.0.0.txt)
- 查看全部版本：[Releases](https://github.com/butonlyif/evoverse-sdk-releases/releases)

## 安装

1. 解压交付包
2. 阅读包内 `START-HERE.md`，按引导完成扩展安装（3 个 VSIX）与 Efinity / RK3588 工具链配置
3. Windows 用户可直接运行包内 `scripts/deploy.ps1`，Linux/macOS 运行 `scripts/deploy.sh`

## 交付包内容

- 3 个 VSIX：`evoverse-sdk`（主扩展）、`evoverse-efinity-adapter`、`evoverse-rk3588-adapter`
- 77 篇客户文档（含离线文档门户站点）
- 6 个 Agent Skills（RTL / Efinity / RK3588 / Design Spec / Board Create / Project Review）
- 工具脚本与部署脚本（`deploy.ps1` / `deploy.sh`）

## 说明

- catalog 板卡物料与 IP 库不随包发布，安装扩展后通过 `EvoVerse: Sync Catalog` 命令获取
- 问题反馈请通过项目渠道联系维护者
