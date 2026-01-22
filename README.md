# Melange Protocol v0.9

**Structured feedback loops for AI-assisted teams.**

## The Problem

When multiple human-AI teams ("Constructs") work in the same org, feedback gets messy:
- Issues pile up in the wrong repos
- Urgent requests get lost in noise
- No clear signal of intent or impact
- AI agents auto-process without human judgment

## The Solution

Melange is a **sender-side outbox protocol**. When you have feedback for another team:

1. **You create the Issue in YOUR repo** (not theirs)
2. **Discord notifies them** with structured context
3. **They review and respond** in your Issue thread
4. **Resolution requires artifacts** (PRs with evidence)

This keeps backlogs clean while enabling tight feedback loops.

## What's a Construct?

A **Construct** is a human-AI pair working as a unit. Examples:
- `soju@Sigil` — soju (human) + Sigil AI agent
- `jani@Loa` — jani (human) + Loa AI agent

Melange enables Constructs to communicate with clear intent and human oversight.

## Core Principles

1. **Sender owns the noise** — Issues live in sender's repo, not receiver's
2. **Structured intent** — Form captures impact, evidence, request, reasoning
3. **Human-in-the-loop always** — No auto-processing; humans accept/decline every Issue
4. **Artifact-gated commitment** — Conversations stay fluid; commitments require PRs

## Quick Start

```bash
# 1. Copy files to your repo
gh repo clone 0xHoneyJar/melange /tmp/melange
mkdir -p .github/ISSUE_TEMPLATE .github/workflows
cp /tmp/melange/.github/ISSUE_TEMPLATE/melange.yml .github/ISSUE_TEMPLATE/
cp /tmp/melange/.github/workflows/melange-notify.yml .github/workflows/

# 2. Create labels
/tmp/melange/scripts/create-labels.sh YOUR-ORG/YOUR-REPO

# 3. Set up Discord webhook (optional but recommended)
gh secret set MELANGE_DISCORD_WEBHOOK --repo YOUR-ORG/YOUR-REPO

# 4. Create your first Melange Issue!
```

## Workflow

```
Sigil identifies pain point → Creates Melange Issue in sigil repo
→ Discord notifies Loa → Loa operator reviews in sigil repo
→ Loa operator comments "Accepted" → Loa creates PR in loa repo
→ PR merged → Loa comments "Resolved via loa#49" → Issue closed
```

## Impact Levels

| Impact | When to Use | Discord |
|--------|-------------|---------|
| **game-changing** | Blocks core workflow | 🔴 Red embed + @here ping |
| **important** | Significant friction | 🟡 Yellow embed |
| **nice-to-have** | Improvement idea | Silent (GitHub search only) |

### Discord Notification Preview

```
┌─────────────────────────────────────────────┐
│ 🟡 Request: Improve error messages          │
├─────────────────────────────────────────────┤
│ From: soju@Sigil    To: loa    Intent: ask  │
├─────────────────────────────────────────────┤
│ Experience                                  │
│ Error messages don't include context...     │
├─────────────────────────────────────────────┤
│ Request                                     │
│ Add file path and line number to errors     │
├─────────────────────────────────────────────┤
│ Melange Protocol • sigil#42    Jan 22, 2026 │
└─────────────────────────────────────────────┘
```

## Documentation

- [Setup Guide](docs/setup.md) — Install Melange on your repository
- [Workflow Guide](docs/workflow.md) — Understand the Issue lifecycle

## Repository Contents

```
.github/
├── ISSUE_TEMPLATE/
│   └── melange.yml          # Issue form template
└── workflows/
    └── melange-notify.yml   # Discord notification action

scripts/
└── create-labels.sh         # Label setup script

docs/
├── setup.md                 # Installation guide
└── workflow.md              # Workflow documentation
```

## Prerequisites

- [GitHub CLI](https://cli.github.com/) (`gh`)
- Discord webhook URL (for notifications)

## License

MIT

---

Part of the [Loa Framework](https://github.com/0xHoneyJar/loa) ecosystem.
