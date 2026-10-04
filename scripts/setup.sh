#!/usr/bin/env bash
# careKind 本地环境一键设置（第一次 clone 后运行一次；重复运行也安全）
#   1. 初始化并拉取 git submodule（06-app-development/app → Metatree-AI-Lab/carekind-app）
#   2. 两个仓库都启用 .githooks（pre-commit：文件行数 + 分层文档检查）
#   3. 让 git pull / checkout 自动带上 submodule
#   4. 检查依赖工具并运行一次检查脚本
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP_DIR="06-app-development/app"
cd "$ROOT"

echo "1/4 初始化 submodule（${APP_DIR}）"
git submodule sync --recursive
git submodule update --init --recursive
if [[ ! -f "${APP_DIR}/CLAUDE.md" ]]; then
	echo "❌ submodule 没有拉取成功。请确认你有 Metatree-AI-Lab/carekind-app 的访问权限，并且 SSH key 已添加到 GitHub。" >&2
	exit 1
fi

echo "2/4 启用 pre-commit hooks"
git config core.hooksPath .githooks
git -C "$APP_DIR" config core.hooksPath .githooks

echo "3/4 设置 git 自动处理 submodule"
git config submodule.recurse true
git config push.recurseSubmodules check

echo "4/4 检查依赖工具"
missing_tools=()
for tool in jq pdftotext gh; do
	command -v "$tool" >/dev/null 2>&1 || missing_tools+=("$tool")
done
if (( ${#missing_tools[@]} > 0 )); then
	echo "⚠️  缺少工具：${missing_tools[*]}（macOS：brew install jq poppler gh）。jq 是 Claude Code hook 必需的。"
fi
scripts/check-context-docs.sh

echo "✅ 设置完成。meta repo：$(git rev-parse --short HEAD) · App submodule：$(git -C "$APP_DIR" rev-parse --short HEAD)"
