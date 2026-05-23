# Android TV APK 打包

## 一键打包（Debug APK）

在仓库根目录执行：

```bash
cd android-tv
./build-apk.sh
```

成功后产物位于：

- `android-tv/KVideo-TV-debug.apk`

## 可选：预置线上地址

如果希望 APK 首次打开时自动填入地址：

```bash
cd android-tv
./gradlew assembleDebug -PkvideoUrl="https://your-domain.com"
```


## GitHub Actions 云端打包（推荐）

如果你希望在线上直接产出 APK：

1. 推送代码到 GitHub。
2. 打开仓库的 **Actions** 页面。
3. 选择 **Build Android TV APK** 工作流。
4. 点击 **Run workflow**（可选填写 `kvideo_url`）。
5. 运行完成后，在该次任务的 **Artifacts** 下载 `KVideo-TV-debug-apk`。

工作流文件：`.github/workflows/android-tv-apk.yml`。


## 预置默认订阅源（打包时自动导入）

当前默认会注入：

- `https://raw.githubusercontent.com/rapier15sapper/ew/refs/heads/main/test.json`

可在构建时覆盖：

```bash
cd android-tv
./gradlew assembleDebug -PsubscriptionUrl="https://your-domain.com/sources.json"
```
