#!/bin/bash
# Install AlignCraft skills into OpenAI Codex format
# Downloads skills/*.md → transforms → ~/.agents/skills/<name>/SKILL.md
#
# Usage:
#   bash install_codex.sh
#   curl -sL https://raw.githubusercontent.com/karaposu/AlignCraft/main/install_codex.sh | bash

set -euo pipefail

RAW_URL="https://raw.githubusercontent.com/karaposu/AlignCraft/main"
TARGET="$HOME/.agents/skills"

# Keep this list in sync with skills/ directory
REMOTE_SKILLS=(
  devdocs-foundation.md
  devdocs-foundation-concepts.md
  devdocs-foundation-simplified-concepts.md
  devdocs-foundation-identify-modules.md
  devdocs-foundation-architecture.md
  elaborate.md
  task-desc.md
  task-plan.md
  critic.md
  critic-d.md
  task-impl.md
  arch-small-summary.md
  arch-intro.md
  arch-traces-2.md
  arch-top-improvements.md
  dead-code-index.md
  dead-code-concepts.md
  roadmap.md
  overview-report.md
  align.md
  align-modes.md
  devdocs-archivist.md
)

TMPDIR=$(mktemp -d)
SKILLS_DIR="$TMPDIR/skills"
mkdir -p "$SKILLS_DIR"
trap 'rm -rf "$TMPDIR"' EXIT

echo "Downloading AlignCraft skills..."
for cmd in "${REMOTE_SKILLS[@]}"; do
  echo "  downloading $cmd"
  curl -fsSL "$RAW_URL/skills/$cmd" -o "$SKILLS_DIR/$cmd"
done

SKIP_PATTERN="^old_|^old2_|^odl_|_old\."
installed=0
skipped=0

for src in "$SKILLS_DIR"/*.md; do
  filename="$(basename "$src")"

  if echo "$filename" | grep -qiE "$SKIP_PATTERN"; then
    ((skipped++))
    continue
  fi

  skill_name=""
  skill_desc=""
  has_meta=false

  first_line=$(head -1 "$src")
  second_line=$(sed -n '2p' "$src")

  if [[ "$first_line" =~ ^name:[[:space:]]*(.*) ]]; then
    skill_name="${BASH_REMATCH[1]}"
    has_meta=true
    if [[ "$second_line" =~ ^description:[[:space:]]*(.*) ]]; then
      skill_desc="${BASH_REMATCH[1]}"
    fi
  fi

  if [ -z "$skill_name" ]; then
    skill_name="${filename%.md}"
  fi

  if [ -z "$skill_desc" ]; then
    heading=$(grep -m1 '^# ' "$src" 2>/dev/null || true)
    if [[ "$heading" =~ —[[:space:]]*(.*) ]]; then
      skill_desc="${BASH_REMATCH[1]}"
    else
      skill_desc="$skill_name command"
    fi
  fi

  skill_dir="$TARGET/$skill_name"
  mkdir -p "$skill_dir"

  {
    echo "---"
    echo "name: $skill_name"
    echo "description: $skill_desc"
    echo "---"
    echo ""
    if $has_meta; then
      awk 'NR<=2{next} NR==3 && /^$/{next} {print}' "$src"
    else
      cat "$src"
    fi
  } > "$skill_dir/SKILL.md"

  echo "  OK: $skill_name"
  ((installed++))
done

echo ""
echo "Installed $installed skills to $TARGET"
[ $skipped -gt 0 ] && echo "Skipped $skipped deprecated files"
echo ""
echo "Codex will detect these skills automatically."
echo "In Codex, invoke with \$skill-name (e.g. \$MVL, \$sense-making)"
