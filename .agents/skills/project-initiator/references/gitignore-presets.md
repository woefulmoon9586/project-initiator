# Gitignore Presets

When initializing a new project, select and write the matching `.gitignore` based on the user's stack.

---

## 1. Universal Base (IDE + OS)
Every project should include:
```gitignore
# Operating System Files
.DS_Store
Thumbs.db
desktop.ini

# IDE & Editors
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
.idea/
*.sublime-project
*.sublime-workspace

# Environment Variables & Secrets
.env
.env.local
.env.*.local
*.pem
*.key
```

---

## 2. Node.js / TypeScript / Web
```gitignore
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing & Coverage
coverage/
*.lcov

# Production & Build outputs
dist/
build/
.next/
out/
.nuxt/
.cache/
.turbo/

# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
pnpm-debug.log*

# Misc
.temp/
.tmp/
```

---

## 3. Python
```gitignore
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Distribution / packaging
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/

# Virtual Environments
.venv/
env/
venv/
ENV/
.uv/

# MyPy / Ruff / Testing
.mypy_cache/
.pytest_cache/
.ruff_cache/
.coverage
htmlcov/
```
