---
name: project-initiator
description: Bootstrap and initialize a new project from an initial idea. Brainstorms creative project names (English slug + Chinese companion), safely renames generic folders like "新建文件夹", initializes Git repository, crafts comprehensive README.md, generates .gitignore, and guides tech stack scaffolding.
---

# Project Initiator

Turn a raw project idea into a cleanly structured, git-initialized, and well-documented repository in minutes.

---

## When to Use This Skill

Activate this skill when:
- The user is in an empty directory or default folder (e.g. `新建文件夹`, `New folder`) with a new project idea.
- The user says "我有新项目想法", "帮我初始化新项目", "从零开始起一个项目", or asks to bootstrap a project from scratch.
- The project does not have a formal name, git repo, or README yet.

---

## Core Workflow

```
[User shares idea]
       │
       ▼
1. Brainstorm Names (English slug + Chinese title) ──► Interactive Selection (ask_question)
       │
       ▼
2. Folder Renaming (e.g., "新建文件夹" -> "chosen-name") via rename-and-init.ps1
       │
       ▼
3. Repository Initialization (git init -b main + .gitignore)
       │
       ▼
4. Generate Rich README.md (Introduction, Features, Tech Stack, Roadmap)
       │
       ▼
5. Tech Stack Selection & Scaffolding Guidance (Node/Python/Rust/etc.)
       │
       ▼
6. First Green Commit (git add . && git commit -m "feat: initial commit")
```

---

## Detailed Step-by-Step Instructions

### Step 1: Analyze the Idea & Brainstorm Project Names
When the user shares their initial concept:
1. Identify the core value proposition, audience, domain, and tone (e.g., developer tool, consumer app, automation bot, AI assistant).
2. Brainstorm **3 to 5 distinct naming concepts**. Every concept **MUST** contain:
   - **English Name (Slug / Repo identifier)**: e.g. `flow-craft`, `OmniMind`, `dev-lens`, `prompt-weaver` (lowercase kebab-case or clean PascalCase).
   - **Chinese Companion Name**: e.g. `流光匠心`, `全知智脑`, `开发者之眼`, `织语`.
   - **Tagline**: A punchy 1-sentence description explaining why the name fits.
3. Use the `ask_question` tool to present the options interactively to the user:
   - Make option 1 the `(Recommended)` choice.
   - The user can select one with a single click or write in their own custom name.

---

### Step 2: Safe Folder Renaming
Once the user selects a project name (use the English slug as the directory name):
1. Check the current folder name:
   - If the current folder is named `新建文件夹`, `New folder`, or a generic temporary name, rename it to the chosen English name.
2. Execute the helper script [rename-and-init.ps1](./scripts/rename-and-init.ps1):
   ```powershell
   powershell -ExecutionPolicy Bypass -File "./scripts/rename-and-init.ps1" -NewName "<chosen-english-slug>" -InitGit
   ```
   *Note: In Windows, the script safely steps up one directory level before renaming to prevent folder locking.*

---

### Step 3: Git & .gitignore Setup
1. Ensure the Git repository is initialized on branch `main`:
   ```bash
   git init -b main
   ```
2. Check the user's intended tech stack or create a universal base `.gitignore` using the presets in [gitignore-presets.md](./references/gitignore-presets.md). Include OS files, editor configs, `.env*`, and build outputs.

---

### Step 4: Craft Comprehensive README.md
Create a professional, structured `README.md` at the project root using the templates in [readme-templates.md](./references/readme-templates.md).

The README must include:
- **Title**: `# <English Name> (<Chinese Name>)`
- **Tagline & Status Badges**: (e.g. `In Development`, `MIT License`)
- **📖 Introduction / 项目简介**: 1-2 paragraphs articulating the problem and the user's vision.
- **✨ Core Features / 核心特性**: Bullet points covering planned capabilities.
- **🛠️ Tech Stack / 技术选型**: Recommended or agreed framework/tools.
- **🚀 Quick Start / 快速上手**: Setup commands tailored to the chosen runtime (Node, Python, Go, etc.).
- **🗺️ Roadmap / 路线图**: Phase 1 MVP, Phase 2 Polish, Phase 3 Scaling.

---

### Step 5: Tech Stack Consultation & Scaffolding
Prompt the user for their preferred stack or offer recommended templates:
- **Web Frontend**: `pnpm create vite` or `npx create-next-app`
- **Backend / API**: FastAPI, Express, NestJS, Go Fiber
- **CLI / Tools**: Commander.js, Click, Clap (Rust)
- **Scaffold initial folders**: `src/`, `docs/`, `tests/`

---

### Step 6: Initial Commit & Success Summary
1. Stage and commit the initial project assets:
   ```bash
   git add .
   git commit -m "feat: initial commit for <project-name>"
   ```
2. Present a clear summary of what was configured:
   - Project directory path
   - Git repository status
   - Link to the generated [README.md](file:///./README.md)
   - Immediate next action options (e.g. scaffolding dependencies, writing the first module)
