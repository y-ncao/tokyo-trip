#!/usr/bin/env bash
# 一键发布 Tokyo Trip 页面到 GitHub Pages(公开仓库 tokyo-trip,只含本页面+图片)
# 前置:已安装 GitHub CLI (https://cli.github.com) 并已登录: gh auth login
set -e
cd "$(dirname "$0")"

REPO="tokyo-trip"

echo "==> 检查 gh 登录状态…"
if ! command -v gh >/dev/null; then
  echo "缺少 GitHub CLI。先安装: brew install gh  然后: gh auth login"; exit 1
fi
gh auth status >/dev/null 2>&1 || { echo "未登录,请先运行: gh auth login"; exit 1; }

echo "==> 在当前文件夹初始化 git 仓库: $(pwd)"
[ -d .git ] || git init -q
git add .
git commit -q -m "Tokyo trip page" || echo "(没有新改动,跳过 commit)"
git branch -M main

echo "==> 创建公开仓库 '$REPO' 并推送…"
gh repo create "$REPO" --public --source=. --remote=origin --push

OWNER=$(gh api user -q .login)

echo "==> 开启 GitHub Pages (main / root)…"
gh api -X POST "repos/$OWNER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || gh api -X PUT "repos/$OWNER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || echo "(若此步报错,去仓库 Settings → Pages 手动选 main / root 即可)"

echo ""
echo "✅ 完成。约 1 分钟后页面上线于:"
echo "   https://$OWNER.github.io/$REPO/"
