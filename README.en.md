[简体中文](README.md)

# EvoVerse SDK Customer Packages

EvoVerse SDK is an AI-driven development suite for Efinix FPGA (Efinity toolchain) and RK3588 embedded platforms, delivered as Trae / VS Code extensions: the SDK core extension plus an Efinity Adapter and an RK3588 Adapter, with a documentation portal, Agent Skills, and tooling scripts.

This repository ships **two independent packages** — Chinese and English. Each package contains only its own language content; download the one that matches your language.

## Online Documentation

Browse online before downloading (same content as inside the packages):

- [中文文档门户](https://butonlyif.github.io/evoverse-sdk-releases/zh/customer-portal.html)
- [English Documentation Portal](https://butonlyif.github.io/evoverse-sdk-releases/en/customer-portal.html)

## Download v1.0.0

| Language | Package | Size | SHA256 (first 8) |
|----------|---------|------|------------------|
| 简体中文 | [EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz) | 6.76 MB | `4ACD3A7B` |
| English | [EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz) | 6.73 MB | `3A211457` |

- Full checksums: [SHA256SUMS-v1.0.0.txt](https://github.com/butonlyif/evoverse-sdk-releases/releases/download/v1.0.0/SHA256SUMS-v1.0.0.txt)
- All versions: [Releases](https://github.com/butonlyif/evoverse-sdk-releases/releases)

## Installation

1. Extract the package
2. Follow `START-HERE.md` inside the package to install the extensions (3 VSIXes) and configure the Efinity / RK3588 toolchains
3. On Windows run `scripts/deploy.ps1`; on Linux/macOS run `scripts/deploy.sh`

## Package Contents

- 3 VSIXes: `evoverse-sdk` (core), `evoverse-efinity-adapter`, `evoverse-rk3588-adapter`
- 77 customer documents (including the offline documentation portal site)
- 6 Agent Skills (RTL / Efinity / RK3588 / Design Spec / Board Create / Project Review)
- Tooling scripts and deploy scripts (`deploy.ps1` / `deploy.sh`)

## Notes

- Board catalog material and IP libraries are not shipped in the package; fetch them after installation via the `EvoVerse: Sync Catalog` command
- For issues, contact the maintainer through project channels
