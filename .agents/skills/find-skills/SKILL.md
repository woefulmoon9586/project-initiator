---
name: find-skills
description: Helps users discover and install agent skills when they ask questions like "how do I do X", "find a skill for X", "is there a skill that can...", or express interest in extending capabilities. This skill should be used when the user is looking for functionality that might exist as an installable skill.
---

# Find Skills

This skill helps you discover, evaluate, and install skills from the open agent skills ecosystem (skills.sh) and community registries.

## When to Use This Skill

Use this skill when the user:
- Asks "how do I do X" where X might be a common task with an existing skill
- Says "find a skill for X" or "is there a skill for X"
- Asks "can you do X" where X is a specialized capability
- Expresses interest in extending agent capabilities or installing new skills
- Wants to search for tools, templates, or workflows
- Mentions they wish they had specialized help with a specific domain (e.g., React/Next.js performance, testing, PR review, security audit, deployment)

## Workflow

### Step 1: Understand What They Need
Analyze the user's prompt or request to identify:
- **Domain**: React, Next.js, Python, DevOps, security, code review, git, etc.
- **Specific task**: e.g., optimizing frontend rendering, auditing dependencies, writing PR templates.
- **Suitability**: Confirm whether the capability fits an agent skill package.

### Step 2: Check Popular Skills & Repositories
Before executing custom queries, check known curated skills from prominent publishers:
- `vercel-labs/skills` (e.g., `react-best-practices`, `find-skills`)
- `anthropics/skills` (e.g., frontend design, doc processing)
- Antigravity official/community skills hubs (`antigravityskills.org`, `antigravityskills.com`)

### Step 3: Search for Skills via CLI
Run search commands with a relevant query using the Skills CLI:
```bash
npx skills find [query]
```

Examples:
- User asks "how do I make my React app faster?":
  `npx skills find react performance`
- User asks "can you help me with PR reviews?":
  `npx skills find pr review`
- User asks "I need automated changelog generation":
  `npx skills find changelog`

### Step 4: Verify Quality Before Recommending
Before recommending any discovered skill to the user, verify its reliability:
- **Install count**: Prefer skills with high adoption (e.g. 1,000+ installs). Be cautious with unverified skills with fewer than 100 installs.
- **Source reputation**: Official or well-known organizations (e.g., `vercel-labs`, `anthropics`, `microsoft`) are preferred.
- **Security & Scope**: Ensure the skill does not request dangerous privileges or unvetted scripts.

### Step 5: Present Options to the User
When relevant skills are found, present them clearly:
- **Name & Purpose**: What the skill does and why it fits the user's task.
- **Source & Popularity**: Install count, repository, and author.
- **Installation Command**: Give the user the command to run.
- **Direct Link**: Provide a link to inspect the skill at `https://skills.sh/<package>`.

### Step 6: Install the Skill
Offer to install the skill for the user:
- **Using Skills CLI**:
  ```bash
  npx skills add <owner/repo@skill> -g -y
  ```
- **In Antigravity**:
  - Global scope: Save `SKILL.md` into `~/.gemini/config/skills/<skill-name>/SKILL.md`
  - Workspace scope: Save `SKILL.md` into `<workspace-root>/.agents/skills/<skill-name>/SKILL.md`
