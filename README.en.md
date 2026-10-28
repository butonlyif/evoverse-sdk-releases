[简体中文](README.md)

# EvoVerse SDK Customer Packages

EvoVerse SDK is an AI-driven development suite for Efinix FPGA (Efinity toolchain) and RK3588 embedded platforms, delivered as Trae / VS Code extensions: the SDK core extension plus an Efinity Adapter and an RK3588 Adapter, with a documentation portal, Agent Skills, and tooling scripts.

This repository ships **two independent packages** — Chinese and English. Each package contains only its own language content; download the one that matches your language.

## Features

- **Full Efinity FPGA flow** (Build / Timing / Debug / Program / SW / IP): one-click `efx_run --flow compile` with structured KPI, resource, and clock-domain views; timing violations auto-attributed by a six-fingerprint root-cause engine, with one-click handoff of the full context (RTL + SDC + path analysis) to AI; on-chip debugging is pure CLI — mark RTL signals → build & program → trigger capture (LA) / VIO read-write → VCD opens automatically; natural-language debug intents supported
- **RK3588 embedded platform**: adapter for environment setup, deployment, and project generation, with a built-in BSP / device-tree knowledge base and offline deployment guide
- **AI orchestration**: type `@evoverse` in chat to describe your goal; the Project Control Plane decides whether each step may proceed, and every conclusion carries an evidence receipt; 6 Agent Skills cover RTL baseline / Efinity knowledge / RK3588 / design spec / board creation / project review
- **Board catalog**: verified board material and golden baseline demos synced via `EvoVerse: Sync Catalog` (not shipped in the package)
- **Docs & tutorial**: 77 customer documents with an offline documentation portal inside the package; a 10-chapter hands-on tutorial (WS-E1: SD card → DDR frame buffer → MIPI CSI-2 TX on Titanium Ti60)

## Online Documentation

Browse online before downloading (same content as inside the packages):

- [中文文档门户](https://butonlyif.github.io/evoverse-sdk-releases/zh/customer-portal.html)
- [English Documentation Portal](https://butonlyif.github.io/evoverse-sdk-releases/en/customer-portal.html)

## Download v1.0.0

| Language | Package | Size | SHA256 (first 8) |
|----------|---------|------|------------------|
| 简体中文 | [EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz) | 9.07 MB | `48DF8A09` |
| English | [EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz) | 9.03 MB | `88DB0D73` |

- Full checksums: [SHA256SUMS-v1.0.0.txt](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/SHA256SUMS-v1.0.0.txt)
- All versions: [Releases](https://github.com/butonlyif/evoverse-sdk-releases/releases)

## Installation

1. Extract the package
2. Follow `START-HERE.md` inside the package to install the extensions (3 VSIXes) and configure the Efinity / RK3588 toolchains
3. On Windows run `scripts/deploy.ps1`; on Linux/macOS run `scripts/deploy.sh`

## Requirements

- Trae or VS Code
- Efinity 2026.1+ (required for FPGA builds)
- Icarus Verilog or QuestaSim (required for functional simulation)
- A WS-E1 core module (TJ180A484S) plus baseboard is recommended for board validation; without hardware you can complete every stage up to compilation — hardware stages are honestly marked as pending

## Package Contents

| Component | Description |
|-----------|-------------|
| `evoverse-sdk` VSIX | Core extension: Workbench shell, project wizards, AI orchestration, board catalog |
| `evoverse-efinity-adapter` VSIX | Full Efinity flow: Build / Timing / Debug / Program / SW / IP |
| `evoverse-rk3588-adapter` VSIX | RK3588 development environment and adapter |
| `docs/` | 77 customer documents + offline documentation portal site (same content as the online version) |
| `Skills/` | 6 Agent Skills (RTL / Efinity / RK3588 / Design Spec / Board Create / Project Review) |
| `scripts/` | Deploy scripts (`deploy.ps1` / `deploy.sh`) and tooling scripts |

## Notes

- Board catalog material and IP libraries are not shipped in the package; fetch them after installation via the `EvoVerse: Sync Catalog` command
- For issues, contact the maintainer through project channels
