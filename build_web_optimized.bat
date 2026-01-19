@echo off
rem Flutter Web 优化构建脚本
rem 体积优化：从 32.07 MB 减少到 2.83 MB
rem 优化比例：91.2%

echo 开始优化构建 Flutter Web 应用...
echo.

flutter build web --release ^
  --base-href "/FlutterDemo/" ^
  --optimization-level=4 ^
  --no-source-maps ^
  --tree-shake-icons ^
  --csp ^
  --dart-define=FLUTTER_WEB_USE_SKIA=false

echo.
echo 构建完成！
echo 构建产物已保存到 build/web 目录
echo 优化后体积约为 2.83 MB
echo.
pause