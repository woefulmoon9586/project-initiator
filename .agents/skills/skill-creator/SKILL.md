---
name: skill-creator
description: Create new skills from scratch, customize existing skills, and optimize skill architectures based on user requirements. Use when the user wants to create, scaffold, design, or update an agent skill (SKILL.md), or asks to automate a multi-step workflow into a reusable skill.
---

# Skill Creator

A meta-skill that designs, scaffolds, authors, and validates custom agent skills tailored for Antigravity and the open Agent Skills ecosystem.

---

## When to Use This Skill

Activate this skill whenever the user:
- Asks to "create a skill", "build a skill for X", or "make a new skill"
- Wants to encapsulate a repetitive workflow, standard operating procedure (SOP), or runbook into a reusable agent skill
- Asks to modify, optimize, or debug an existing skill
- Needs advice on skill design, prompt triggers, progressive disclosure, or directory structuring

---

## Skill Architecture Principles

Every skill must conform to the Antigravity & Open Agent Skills standard:

```text
skills/<skill-name>/
├── SKILL.md             # Required: Entry point with YAML frontmatter and core instructions
├── scripts/             # Optional: Deterministic helper scripts (Bash, PowerShell, Python, Node)
├── references/          # Optional: Detailed API specs, style guides, domain references
└── examples/            # Optional: Code templates, sample outputs, or test cases
```

### Key Design Tenets
1. **Progressive Disclosure**:
   - The YAML `description` is always loaded at agent startup.
   - The body of `SKILL.md` is loaded only when the skill is triggered.
   - Bulky documentation and schemas belong in `references/` and are read on demand.
2. **Context-Optimized Descriptions**:
   - Always write in third person.
   - Include clear trigger phrases ("Use this skill when the user asks to...") and negative boundaries ("Do not use when...").
   - Avoid generic buzzwords; emphasize actionable verbs and specific domain keywords.
3. **Actionable & Procedural**:
   - Provide concrete, unambiguous steps rather than high-level philosophies.
   - Include validation checks at each step to ensure task success before concluding.

---

## Workflow: Creating a Skill

Follow this 5-stage lifecycle when creating a new skill:

### Stage 1: Clarify Requirements & Scope
Engage the user to understand the goal:
1. **Target Capability**: What specific task, workflow, or technology does the skill address?
2. **Activation Triggers**: What user phrases or situations should trigger this skill?
3. **Execution Steps**: What tools, files, commands, or checks are needed?
4. **Scope**:
   - **Workspace scope** (project-specific): `.agents/skills/<skill-name>/`
   - **Global scope** (all projects on machine): `~/.gemini/config/skills/<skill-name>/`

*Tip*: If requirements are underspecified, clarify with interactive questions before generating files.

### Stage 2: Determine Directory Structure
Decide whether a single `SKILL.md` suffices or if companion resources are needed:
- **Lean skill** (<250 lines of instructions): Single `SKILL.md` is ideal.
- **Complex skill**:
  - Extract detailed API references or lengthy documentation into `references/*.md`.
  - Extract multi-command routines or heavy parsing tasks into `scripts/*`.
  - Provide sample expected outputs or starter files in `examples/*`.

### Stage 3: Author the Skill
Draft the `SKILL.md` with:

```markdown
---
name: <kebab-case-name>
description: <Clear third-person description stating what the skill does and when to activate it>
---

# <Skill Title>

<Short overview of purpose>

## When to Use This Skill
- <Scenario 1>
- <Scenario 2>

## Instructions / Workflow
### Step 1: <Preparation>
...
### Step 2: <Execution>
...
### Step 3: <Validation & Verification>
...

## Edge Cases & Troubleshooting
- <Issue and resolution>
```

### Stage 4: Install & Validate
1. Write the files into the appropriate directory:
   - For global: `~/.gemini/config/skills/<skill-name>/SKILL.md`
   - For workspace: `.agents/skills/<skill-name>/SKILL.md`
2. Verify YAML frontmatter syntax (must have both `name` and `description`).
3. Ensure all internal relative links (e.g. `[script](scripts/run.sh)`) point to existing files.

### Stage 5: Provide Usage & Test Prompts
Summarize the newly created skill to the user:
- Target installation path
- Trigger conditions
- 2-3 sample prompts that the user can run to test and activate the new skill
