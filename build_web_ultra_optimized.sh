#!/bin/bash
# Flutter Web 极致优化构建脚本 - 目标体积小于 2MB
# 优化策略：移除 NOTICES 文件 + 最大程度树摇 + 最小化

echo "开始极致优化构建 Flutter Web 应用..."
echo

# 清理旧构建
flutter clean

# 极致优化构建
echo "执行极致优化构建..."
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

# 显示结果
echo
echo "构建完成！"
echo "构建产物已保存到 build/web 目录"

echo -e "\n=== 最终体积报告 ==="
du -sh build/web
du -sh build/web/main.dart.js build/web/assets
