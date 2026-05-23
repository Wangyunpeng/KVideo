# TV App 打包指南

本文档提供 KVideo 的 TV 端打包方案，优先级如下：

1. **Apple TV（tvOS）原生壳应用**（推荐用于 Apple TV 设备）
2. **Android TV WebAPK/TWA 壳应用**（适合 Android TV 盒子/电视）

---

## 1) Apple TV（tvOS）打包（推荐）

仓库已提供最小 tvOS 工程源码模板：`apple-tv/KVideoTV/KVideoTV/`。

### 步骤

1. 使用 macOS 打开 Xcode（15+）。
2. 新建 `tvOS App` 项目（SwiftUI + Swift）。
3. 用仓库中的两个文件替换默认文件：
   - `apple-tv/KVideoTV/KVideoTV/KVideoTVApp.swift`
   - `apple-tv/KVideoTV/KVideoTV/ContentView.swift`
4. 修改 `ContentView.swift` 里的 `kvideoURL` 为你的线上地址。
5. 选择 `Any tvOS Device` 或已连接的 Apple TV，执行 `Product -> Archive`。
6. 在 Organizer 中导出 `.ipa`（Development / Ad Hoc）。

### 说明

- 这是 WebView 壳模式，适合个人部署与内网使用。
- 若要上架 App Store，需要满足 Apple 的内容与功能审核要求，纯 Web 包裹通常受限。

---

## 2) Android TV 打包（TWA / WebView 壳）

当前仓库主应用是 Web 站点，可通过 Android Studio 建立 TV 壳工程：

1. 新建 Android 项目（Leanback/TV Activity）。
2. 嵌入 `WebView`，加载你的 KVideo 地址。
3. 在启动时向页面注入 `tv-mode` class（与网页 TV 样式保持一致）。
4. 适配遥控器按键（DPAD、BACK、MEDIA_PLAY_PAUSE）。
5. 生成签名包：
   - Debug: `app-debug.apk`
   - Release: `app-release.aab` / `app-release.apk`

> 如果你希望我继续，我可以在仓库内补一份最小 Android TV 壳工程骨架（Gradle + Activity + WebView + 遥控器映射）。

---

## 3) 发布前检查清单

- [ ] 线上地址可访问且 HTTPS 证书有效
- [ ] 默认进入 TV 模式（焦点可见、遥控器可导航）
- [ ] 首页和播放页在 1080p/4K 电视上布局正常
- [ ] 遥控器 `Back` 行为符合预期
- [ ] 弱网下加载与重试逻辑可用
- [ ] 图标、启动图、包名、版本号已更新

