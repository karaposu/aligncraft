#!/bin/bash
# Install AlignCraft slash commands and hooks for Claude Code
# Usage: curl -sL https://raw.githubusercontent.com/karaposu/AlignCraft/main/install_claude.sh | bash

set -e

REPO_URL="https://raw.githubusercontent.com/karaposu/AlignCraft/main"
COMMANDS_DIR="$HOME/.claude/commands"
HOOKS_DIR="$HOME/.claude/hooks"

mkdir -p "$COMMANDS_DIR"
mkdir -p "$HOOKS_DIR"

# --- Slash Commands ---

echo "Installing slash commands..."

commands=(
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
  arch-traces.md
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

for cmd in "${commands[@]}"; do
  echo "  downloading $cmd"
  curl -sL "$REPO_URL/skills/$cmd" -o "$COMMANDS_DIR/$cmd"
done

# --- Hooks ---

echo ""
echo "Installing hooks..."

hooks=(
  devdocs_metadata_appender.sh
)

for hook in "${hooks[@]}"; do
  echo "  downloading $hook"
  curl -sL "$REPO_URL/hooks/$hook" -o "$HOOKS_DIR/$hook"
  chmod +x "$HOOKS_DIR/$hook"
done

# --- Settings: grant Read access to ~/.claude/skills ---

echo ""
echo "Updating ~/.claude/settings.json..."

SETTINGS_FILE="$HOME/.claude/settings.json"
SKILLS_DIR="$HOME/.claude/skills"
ALLOW_RULE="Read(//$SKILLS_DIR/**)"

if ! command -v jq >/dev/null 2>&1; then
  echo "  jq not installed — skipping. Add manually to $SETTINGS_FILE:"
  echo "    permissions.allow              += [\"$ALLOW_RULE\"]"
  echo "    permissions.additionalDirectories += [\"$SKILLS_DIR\"]"
else
  [ -f "$SETTINGS_FILE" ] || echo '{}' > "$SETTINGS_FILE"

  tmp=$(mktemp)
  if jq \
       --arg rule "$ALLOW_RULE" \
       --arg dir "$SKILLS_DIR" \
       '
       .permissions                       = (.permissions // {})
       | .permissions.allow                 = (.permissions.allow // [])
       | .permissions.additionalDirectories = (.permissions.additionalDirectories // [])
       | if (.permissions.allow | index($rule)) then . else .permissions.allow += [$rule] end
       | if (.permissions.additionalDirectories | index($dir)) then . else .permissions.additionalDirectories += [$dir] end
       ' "$SETTINGS_FILE" > "$tmp"; then
    mv "$tmp" "$SETTINGS_FILE"
    echo "  ensured allow rule:           $ALLOW_RULE"
    echo "  ensured additionalDirectory:  $SKILLS_DIR"
  else
    rm -f "$tmp"
    echo "  jq failed — settings.json unchanged (is it valid JSON?)"
  fi
fi

# --- Summary ---

echo ""
echo "Done. Installed ${#commands[@]} slash commands to $COMMANDS_DIR"
echo "Done. Installed ${#hooks[@]} hooks to $HOOKS_DIR"
echo ""
echo "Slash commands: $(printf '/%s, ' "${commands[@]%.md}" | sed 's/, $//')"
echo ""
echo "To activate the devdocs metadata hook, add this to .claude/settings.json:"
echo ""
echo '  {"hooks":{"PreToolUse":[{"matcher":"Write","hooks":[{"type":"command","command":"~/.claude/hooks/devdocs_metadata_appender.sh"}]}]}}'
echo ""
