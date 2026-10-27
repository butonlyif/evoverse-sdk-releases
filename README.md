[English](README.en.md)

# EvoVerse SDK 客户交付包

EvoVerse SDK 是面向 Efinix FPGA（Efinity 工具链）与 RK3588 嵌入式平台的 AI 驱动开发套件，以 Trae / VS Code 扩展形式交付：SDK 主扩展 + Efinity Adapter + RK3588 Adapter，配套文档门户、Agent Skills 与工具脚本。

本仓库同时提供**中文版**与**英文版**两套独立交付包，内容互不包含——按你的语言下载其中一个即可。

## 功能特性

- **Efinity FPGA 全流程**（Build / Timing / Debug / Program / SW / IP）：一键编译 `efx_run --flow compile`，KPI、资源占用与时钟域结构化呈现；时序违例由六类指纹根因分类引擎自动归因，可把完整上下文（RTL + SDC + 路径分析）一键交给 AI 追问；板上调试纯 CLI 完成——选中 RTL 信号加入调试 → 编译烧录 → 触发采集（LA）/ VIO 读写 → VCD 自动打开，支持自然语言调试 Intent
- **RK3588 嵌入式平台**：开发环境准备、部署与工程生成的适配器，内置 BSP / 设备树知识库与离线部署指引
- **AI 编排**：聊天框 `@evoverse` 用自然语言描述目标，Project Control Plane 决定每一步是否允许推进，结论均带证据回执；6 个 Agent Skills 覆盖 RTL 基线 / Efinity 知识库 / RK3588 / 设计规格 / 板卡创建 / 项目评审
- **板卡 Catalog**：经 `EvoVerse: Sync Catalog` 同步实测通过的板卡物料与权威基线 demo（不随包发布）
- **文档与教程**：77 篇客户文档随包提供离线文档门户；10 篇实战教程（WS-E1：SD card → DDR frame buffer → MIPI CSI-2 TX，Titanium Ti60）

## 在线文档

下载前可先在线浏览，内容与交付包内一致：

- [中文文档门户](https://butonlyif.github.io/evoverse-sdk-releases/zh/customer-portal.html)
- [English Documentation Portal](https://butonlyif.github.io/evoverse-sdk-releases/en/customer-portal.html)

## 下载 v1.0.0

| 语言 | 交付包 | 大小 | SHA256（前 8 位） |
|------|--------|------|-------------------|
| 简体中文 | [EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz) | 9.06 MB | `27183E21` |
| English | [EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz) | 8.99 MB | `8C30829E` |

- 完整校验值见 Release 附件 [SHA256SUMS-v1.0.0.txt](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/SHA256SUMS-v1.0.0.txt)
- 查看全部版本：[Releases](https://github.com/butonlyif/evoverse-sdk-releases/releases)

## 安装

1. 解压交付包
2. 阅读包内 `START-HERE.md`，按引导完成扩展安装（3 个 VSIX）与 Efinity / RK3588 工具链配置
3. Windows 用户可直接运行包内 `scripts/deploy.ps1`，Linux/macOS 运行 `scripts/deploy.sh`

## 环境要求

- Trae 或 VS Code
- Efinity 2026.1+（FPGA 编译需要）
- Icarus Verilog 或 QuestaSim（功能仿真需要）
- 板卡验证建议 WS-E1 核心模组（TJ180A484S）+ 底板；无硬件也能完成到编译为止的全部阶段，硬件验证阶段会如实标记为待执行

## 交付包内容

| 组件 | 说明 |
|------|------|
| `evoverse-sdk` VSIX | 主扩展：Workbench 外壳、项目向导、AI 编排、板卡 Catalog |
| `evoverse-efinity-adapter` VSIX | Efinity 全流程：Build / Timing / Debug / Program / SW / IP |
| `evoverse-rk3588-adapter` VSIX | RK3588 开发环境与适配器 |
| `docs/` | 77 篇客户文档 + 离线文档门户站点（与在线版内容一致） |
| `Skills/` | 6 个 Agent Skills（RTL / Efinity / RK3588 / Design Spec / Board Create / Project Review） |
| `scripts/` | 部署脚本（`deploy.ps1` / `deploy.sh`）与工具脚本 |

## 说明

- catalog 板卡物料与 IP 库不随包发布，安装扩展后通过 `EvoVerse: Sync Catalog` 命令获取
- 问题反馈请通过项目渠道联系维护者
