# Project Initiator (新项目发起器)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Agent Skill](https://img.shields.io/badge/Agent%20Skill-Standard-purple.svg)](https://skills.sh)
[![Antigravity](https://img.shields.io/badge/Antigravity-Compatible-emerald.svg)](https://antigravity.google)

> Turn a raw idea into a cleanly structured, git-initialized, and well-documented repository in minutes.  
> 从一个模糊的想法，一键完成项目命名脑暴、文件夹规范重命名、Git 初始化与专业 README 搭建。

---

## ✨ Features / 核心特性

- 💡 **Idea-to-Name Brainstorming**: Automatically suggests 3–5 bilingual (English slug + Chinese companion) project names with reasoning and taglines.
- 📁 **Safe Folder Renaming**: Safely renames temporary directories (like `新建文件夹` or `New folder`) on Windows without process locking.
- ⚡ **One-Click Repository Setup**: Initializes Git with `main` branch and sets up a robust `.gitignore`.
- 📝 **Rich README Generation**: Creates professional, badge-equipped documentation covering introduction, key features, architecture, and roadmaps.
- 🛠️ **Tech Stack Scaffolding**: Offers recommendations and commands for modern frameworks (Vite, Next.js, FastAPI, etc.).

---

## 🚀 Installation / 安装使用

### Method 1: In Google Antigravity
Clone or copy this skill into your Antigravity skills directory:

**Global Scope (Available across all projects):**
```bash
# Clone directly into global config
git clone https://github.com/woefulmoon9586/project-initiator.git ~/.gemini/config/skills/project-initiator
```

**Workspace Scope (Available in current project):**
```bash
# Clone directly into project .agents/skills
git clone https://github.com/woefulmoon9586/project-initiator.git .agents/skills/project-initiator
```

### Method 2: Via Skills CLI (skills.sh)
```bash
npx skills add woefulmoon9586/project-initiator
```

---

## 📖 Workflow / 执行工作流

```
[User shares idea]
       │
       ▼
1. Brainstorm Names (English slug + Chinese title) ──► Interactive Selection
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

## 📂 Repository Structure

```text
project-initiator/
├── SKILL.md                          # Main skill instruction & triggers
├── README.md                         # Documentation & installation guide
├── LICENSE                           # MIT License
├── scripts/
│   └── rename-and-init.ps1           # Safe directory renaming & git init script
└── references/
    ├── readme-templates.md           # Professional README templates (Web, CLI, API)
    └── gitignore-presets.md          # Popular .gitignore configurations
```

---

## 📄 License

Distributed under the MIT License. See [LICENSE](LICENSE) for more details.
