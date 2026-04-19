# Kickoff prompt for Claude Code

This document has two parts:
1. **One-time setup** — do this once before your first Claude Code session
2. **The prompt** — paste this into Claude Code to start the build

---

## Part 1 — One-time setup

### Step 1: Create the project folder (NOT the same as your source folder)

Your source data and CV live here:
```
C:\Users\user\Desktop\profit shifting data and cv for website\
├── CV.docx (or CV.pdf)
├── Table 8_data.dta
└── Table 11_data.dta
```

**Leave this folder alone.** It stays on your laptop as the source-of-truth. We never copy `.dta` files into the git repo — we only derive CSVs from them.

Create a **separate** project folder next to it:
```
C:\Users\user\Desktop\fotisdelis-website\
```
This is where Claude Code will work and where the git repo lives.

### Step 2: Install the skill

Inside `fotisdelis-website`, create this folder structure and drop `SKILL.md` into it:
```
C:\Users\user\Desktop\fotisdelis-website\
└── .claude\
    └── skills\
        └── fotisdelis-website\
            └── SKILL.md
```

Windows File Explorer hides folders starting with a dot — either enable "Show hidden items" in the View menu, or create the folders from PowerShell:
```powershell
cd C:\Users\user\Desktop\fotisdelis-website
New-Item -ItemType Directory -Path ".claude\skills\fotisdelis-website" -Force
# then copy SKILL.md into .claude\skills\fotisdelis-website\
```

### Step 3: Install Claude Code

If you don't have it yet: follow the instructions at `docs.claude.com/en/docs/claude-code`.

### Step 4: Make sure Python is installed

Claude Code will use Python (via pandas) to read your `.dta` files directly. Open PowerShell and run `python --version`. If it's not installed, Claude Code can help you install it, but it's faster if you install Python 3.11+ beforehand from `python.org`.

### Step 5: Open Claude Code in the project folder

```powershell
cd C:\Users\user\Desktop\fotisdelis-website
claude
```

### Step 6: Paste the prompt from Part 2 below.

---

## Part 2 — The prompt (copy everything between the lines)

---

I want to improve my academic website and build an interactive data visualization for it. Use the `fotisdelis-website` skill — it has the full spec (folder structure, data schema, page structure, text conventions, JRC disclaimer rules, color palette, deployment steps, data safety rules). Read the skill first, then follow its "Execution order when invoked fresh" section.

**Context you already know from the skill, so don't re-ask:**
- Two-folder strategy: SOURCE folder is `C:\Users\user\Desktop\profit shifting data and cv for website\` (read-only, never committed); PROJECT folder is the current directory (this becomes the git repo).
- Source folder contains exactly three files: `CV.docx` (or `.pdf`), `Table 8_data.dta`, `Table 11_data.dta`.
- Data schema: Table 11 has `year, guocountry, lowest_tax_country, MNE_profit_shifting` (in $bn, country names are full names). Table 8 has `year, Industry, Nacerev, MNE_profit_shifting` (in $bn).
- GitHub username: `fntel7`. GitHub Pages URL will be `https://fntel7.github.io/profit-shifting-explorer/`.
- Target repo name: `profit-shifting-explorer` (public, does not exist yet).
- Read `.dta` files via pandas (don't try to invoke Stata), but ALSO write the Stata `.do` file for my reproducibility record.

**Build everything per the skill:**

1. `.gitignore` FIRST (before anything else touches git)
2. Project folder structure (`docs/`, `stata/`)
3. Read the `.dta` files with pandas; confirm the schema; print a quick data summary (year range, unique country counts, presence of negatives/NaNs)
4. Scan country names against Plotly's country list; build a normalization dictionary for any mismatches
5. Generate `docs/country_data.csv` and `docs/industry_data.csv`
6. Write `stata/export_for_website.do` for reproducibility
7. Build `docs/index.html` — the three-tab explorer (map, time series, industry ranking)
8. Test locally via `python -m http.server 8000` in `docs/` — I'll open it in my browser and give you feedback
9. `homepage.md` and `profit_shifting_page.md` (paste-ready for Google Sites)
10. Read my existing CV from the source folder and produce `FotisDelis_CV.docx` in the project root — restructure per the skill, keep all factual content, remove "Profit Shifting and Firm Credit", add "Stairway to Tax Haven" to work in progress
11. `seo_checklist.md` and `README.md`
12. Walk me through the GitHub Pages deployment step by step, with the `git status` safety check before every commit
13. Hand me the final iframe URL and the HTML snippet for Google Sites

**Workflow preferences:**
- I code in Stata primarily
- Pause and ask me if you hit ambiguity (negative values, country-name oddities, missing CV sections, abstract for "Stairway to Tax Haven")
- Test before deploying
- Show me the data summary in step 3 before you proceed — I want to sanity-check before code gets written on top of it

Start by reading the skill, then listing the source folder contents and reading the `.dta` files with pandas.

---

## Part 3 — Tips while working

### During the build
- **Let it show you the data summary in step 3.** If something looks off (e.g., country names have weird whitespace, years are unexpected), catch it early.
- **Review the `.gitignore`** before the first `git add`. Make sure `*.dta` is in there.
- **Review the Stata `.do` file** even though Claude Code uses pandas for the build — you'll want the `.do` for later runs.
- **Test the viz locally first.** Claude Code will give you `http://localhost:8000` — open it in Chrome or Edge and click through all three tabs before deploying.

### During deployment
- **Run `git status` yourself** before every commit. If you see `Table 11_data.dta` or `Table 8_data.dta` staged, STOP — the `.gitignore` isn't catching them and something is wrong.
- **Create the GitHub repo in the browser first** (`github.com/new`, name it `profit-shifting-explorer`, public, no README/gitignore/license — we already have them). Then let Claude Code push to it.

### After deployment
- **Test the live URL** (`https://fntel7.github.io/profit-shifting-explorer/`) in a private/incognito window before iframing into Google Sites. If it doesn't work, Pages may still be building (wait 2 min).
- **In Google Sites**, use Insert → Embed → Embed code, then paste the iframe snippet. Resize the section so the iframe has enough vertical space.

### Follow-up sessions

The skill is designed to be reusable. For future edits, just tell Claude Code what you want and mention the skill:
- *"Using the fotisdelis-website skill, add a new working paper titled X to the homepage and CV."*
- *"Using the fotisdelis-website skill, regenerate the CSVs — I updated the Stata data."*
- *"Using the fotisdelis-website skill, change the map color scale to diverging."*
- *"Using the fotisdelis-website skill, add a news entry about my presentation at [conference]."*

Claude Code will load the skill, recognize the conventions, and stay consistent across sessions.

### Budget expectations

For the initial build (all six deliverables, testing, deployment): expect 1.5–3 hours of interactive work spread across 1–2 sessions, most of it on your side reviewing and approving. For incremental edits afterwards: usually 5–15 minutes.
