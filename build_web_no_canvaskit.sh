#!/bin/bash
# Flutter Web 无 CanvasKit 构建脚本
# 优化策略：仅生成 HTML 渲染器构建 + 移除所有 CanvasKit 文件 + 移除 NOTICES

echo "开始构建无 CanvasKit 的 Flutter Web 应用..."
echo

# 清理旧构建
flutter clean

# 仅生成 HTML 渲染器构建
echo "执行无 CanvasKit 构建..."
flutter build web --release \
  --base-href "/FlutterDemo/" \
  --dart-define=FLUTTER_WEB_USE_SKIA=false \
  --tree-shake-icons \
  --no-source-maps \
  --csp

echo

# 移除大文件
echo "移除不必要的大文件..."
if [ -f "build/web/assets/NOTICES" ]; then
  rm -f "build/web/assets/NOTICES"
  echo "✓ 已移除 1.3MB 的 NOTICES 文件"
fi

# 移除 CanvasKit 目录
if [ -d "build/web/canvaskit" ]; then
  # 移动到 /tmp 目录以便清理
  mv build/web/canvaskit /tmp/canvaskit_$(date +%s)
  echo "✓ 已移除 27MB 的 CanvasKit 目录"
fi

# 显示结果
echo
echo "构建完成！"
echo "构建产物已保存到 build/web 目录"

echo -e "\n=== 最终体积报告 ==="
du -sh build/web
du -sh build/web/main.dart.js build/web/assets
