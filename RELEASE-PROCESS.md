# 发布流程（维护者指南）

本仓库内容分两部分：

- **git 内容**（本仓库）：双语 README、本文件、`docs/`（GitHub Pages 站点快照）
- **Release 资产**（不进 git）：zh / en 两个交付包 `tar.gz` + `SHA256SUMS-v<版本>.txt`

私有开发仓（下称 `awesomsdk`）的 `release/` 目录是全部资产来源。

## 每版发布步骤

以版本 `v<ver>` 为例，`<REL>` 指私有仓 `release\` 目录：

1. **私有仓双语打包**（构建 VSIX + tar.gz + 单包 .sha256）：
   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File scripts\release-package.ps1
   powershell -NoProfile -ExecutionPolicy Bypass -File scripts\release-package.ps1 -Lang en
   ```
2. **Pages 站点安全自查**（确认无私网/内部链接泄漏）：
   ```powershell
   Get-ChildItem <awesomsdk>\docs\site, <awesomsdk>\docs\site-en -Recurse -Filter *.html |
     Select-String -Pattern '192\.168\.|10\.\d+\.|172\.(1[6-9]|2\d|3[01])\.|\.corp|intranet|localhost'
   ```
   无输出即通过。
3. **同步 Pages 站点到本仓库**（保留 `docs\index.html`）：
   ```powershell
   Remove-Item -Recurse -Force docs\zh, docs\en
   Copy-Item -Recurse <awesomsdk>\docs\site docs\zh
   Copy-Item -Recurse <awesomsdk>\docs\site-en docs\en
   ```
4. **更新双语 README 下载表**：版本号、大小、SHA256 前 8 位、直链。
5. **生成合并校验文件**：
   ```powershell
   $files = 'EvoVerse-SDK-v<ver>-Customer-Package.tar.gz','EvoVerse-SDK-v<ver>-Customer-Package-EN.tar.gz'
   $files | ForEach-Object { $h = (Get-FileHash -Algorithm SHA256 "<REL>\$_").Hash.ToLower(); "$h  $_" } |
     Set-Content "SHA256SUMS-v<ver>.txt" -Encoding ascii
   ```
6. **提交推送**（按私有仓 git 规范，`git add` 具体文件）：
   ```powershell
   git add README.md README.en.md RELEASE-PROCESS.md docs SHA256SUMS-v<ver>.txt
   git commit -m "release: v<ver> packages and docs portal snapshot"
   git push
   git tag v<ver>
   git push origin v<ver>
   ```
7. **上传 Release 资产**：
   ```powershell
   gh release create v<ver> "<REL>\EvoVerse-SDK-v<ver>-Customer-Package.tar.gz" `
     "<REL>\EvoVerse-SDK-v<ver>-Customer-Package-EN.tar.gz" "SHA256SUMS-v<ver>.txt" `
     --title "EvoVerse SDK v<ver>" --notes "<要点>"
   ```
8. **Pages 部署**：首次需在 GitHub 网页开启一次：Settings → Pages → Source 选 `Deploy from a branch` → Branch 选 `main` 与 `/docs` → Save。此后每次 push 到 main 自动部署。

## 首次发布 v1.0.0

当前目录已就绪：双语 README、`docs\index.html` 着陆页、`docs\zh` / `docs\en` 站点快照、`.nojekyll`。剩余步骤：

1. 创建空公开仓库（不要初始化 README）：
   ```powershell
   gh repo create butonlyif/evoverse-sdk-releases --public
   ```
   （或 GitHub 网页创建）
2. 提交并推送：
   ```powershell
   git add README.md README.en.md RELEASE-PROCESS.md .nojekyll docs
   git commit -m "initial: v1.0.0 zh/en packages and docs portal"
   git remote add origin https://github.com/butonlyif/evoverse-sdk-releases.git
   git push -u origin main
   ```
3. 上传 Release 资产（`SHA256SUMS-v1.0.0.txt` 已预生成在 `<REL>`）：
   ```powershell
   gh release create v1.0.0 `
     "<REL>\EvoVerse-SDK-v1.0.0-Customer-Package.tar.gz" `
     "<REL>\EvoVerse-SDK-v1.0.0-Customer-Package-EN.tar.gz" `
     "<REL>\SHA256SUMS-v1.0.0.txt" `
     --title "EvoVerse SDK v1.0.0" `
     --notes "首个公开发布。中文包与英文包内容独立，按语言下载其一。See README for details."
   ```
4. 开启 Pages（Settings → Pages → main + `/docs`），验证：
   - `https://butonlyif.github.io/evoverse-sdk-releases/` 着陆页按语言跳转
   - 两个门户可浏览、两个 tar.gz 可下载且 SHA256 匹配
