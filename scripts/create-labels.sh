#!/usr/bin/env bash
# Melange Protocol v0.8 - Label Setup Script
# Creates all required labels for a repository
#
# Usage: ./create-labels.sh OWNER/REPO

set -euo pipefail

REPO="${1:?Usage: ./create-labels.sh OWNER/REPO}"

echo "Creating Melange labels in $REPO..."

# Type label
gh label create "melange" \
  --repo "$REPO" \
  --color "7B68EE" \
  --description "Melange protocol thread" \
  --force

# Routing labels
for construct in sigil loa registry; do
  gh label create "to:$construct" \
    --repo "$REPO" \
    --color "0052CC" \
    --description "Addressed to $construct Construct" \
    --force
done

# Impact labels
gh label create "impact:game-changing" \
  --repo "$REPO" \
  --color "B60205" \
  --description "Blocks core workflow" \
  --force

gh label create "impact:important" \
  --repo "$REPO" \
  --color "FBCA04" \
  --description "Significant friction" \
  --force

gh label create "impact:nice-to-have" \
  --repo "$REPO" \
  --color "C2E0C6" \
  --description "Improvement" \
  --force

# Status labels
gh label create "status:open" \
  --repo "$REPO" \
  --color "0E8A16" \
  --description "Awaiting response" \
  --force

gh label create "status:accepted" \
  --repo "$REPO" \
  --color "0E8A16" \
  --description "Receiver working on it" \
  --force

gh label create "status:blocked" \
  --repo "$REPO" \
  --color "FBCA04" \
  --description "Waiting on external" \
  --force

gh label create "status:declined" \
  --repo "$REPO" \
  --color "6A737D" \
  --description "Receiver declined" \
  --force

gh label create "status:resolved" \
  --repo "$REPO" \
  --color "6A737D" \
  --description "Completed" \
  --force

# Intent labels (optional)
for intent in request ask report; do
  gh label create "intent:$intent" \
    --repo "$REPO" \
    --color "D4C5F9" \
    --description "Intent: $intent" \
    --force
done

echo "✓ Melange labels created in $REPO"
