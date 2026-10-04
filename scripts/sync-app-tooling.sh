#!/usr/bin/env bash
# 把 meta repo（唯一来源）里的共用开发工具同步到 App 仓库（submodule），避免两边各自修改（DRY）。
# 用法：scripts/sync-app-tooling.sh [App 仓库路径，默认 06-app-development/app]
# 同步后到 App 仓库里检查 diff 并单独提交。
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-$ROOT/06-app-development/app}"
SHARED_FILES=(
	".editorconfig"
	"scripts/check-file-length.sh"
	"scripts/check-context-docs.sh"
)

if [[ ! -d "$TARGET" ]]; then
	echo "❌ 找不到 App 仓库：${TARGET}（先执行 git submodule update --init）" >&2
	exit 1
fi

for file in "${SHARED_FILES[@]}"; do
	mkdir -p "$TARGET/$(dirname "$file")"
	cp "$ROOT/$file" "$TARGET/$file"
	echo "🔄 $file"
done
echo "✅ 已同步到 ${TARGET}。请在 App 仓库中检查 git diff 后提交。"
