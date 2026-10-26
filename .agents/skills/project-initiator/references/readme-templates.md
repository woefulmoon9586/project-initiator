# Project README Templates

This reference contains structured, modern README.md templates that the agent can adapt when initializing a project.

---

## 1. Web / Fullstack Application Template

```markdown
# <Project English Name> (<Project Chinese Name>)

<p align="center">
  <strong><One-line punchy tagline explaining value proposition></strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-In%20Development-yellow" alt="Status">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License">
</p>

---

## 📖 Introduction / 项目简介

<Detailed 1-2 paragraph description based on the user's initial idea. Explain what problem this project solves, who it is for, and the core experience it delivers.>

### ✨ Key Features / 核心特性

- 🚀 **Feature 1**: Description of capability.
- 🎨 **Feature 2**: Description of capability.
- ⚡ **Feature 3**: Description of capability.
- 🔒 **Feature 4**: Description of capability.

---

## 🛠️ Tech Stack / 技术选型

- **Frontend**: <React / Next.js / Vue / Tailwind CSS>
- **Backend / API**: <Node.js / FastAPI / Go / Express>
- **Database / Cache**: <PostgreSQL / SQLite / Redis / Supabase>
- **Tooling**: <Vite / TypeScript / Biome / Turborepo>

---

## 🚀 Quick Start / 快速上手

### Prerequisites
- Node.js >= 20
- pnpm >= 9

### Installation
```bash
# Clone the repository
git clone <repo-url>
cd <project-name>

# Install dependencies
pnpm install

# Start development server
pnpm dev
```

---

## 🗺️ Roadmap / 路线图

- [ ] MVP: Core feature implementation
- [ ] User authentication & workspace setup
- [ ] UI polish & responsive design
- [ ] Production deployment

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
```

---

## 2. CLI / Developer Tool Template

```markdown
# <tool-name>

> <One-line punchy description of what the tool does>

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

---

## 💡 Why <tool-name>?

<Explain the pain point and how this tool provides a faster, simpler, or automated solution.>

## 📦 Installation

```bash
# Via npm/pnpm
pnpm add -g <tool-name>

# Or run directly via npx
npx <tool-name>
```

## 💻 Usage

```bash
# Basic command
<tool-name> run --help
```

## ⚙️ Configuration

Create a `<tool-name>.config.json` in your project root:
```json
{
  "option": true
}
```

## 📄 License
MIT
```
