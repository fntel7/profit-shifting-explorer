---
name: fotisdelis-website
description: Complete specification for building and maintaining Fotis Delis's academic website (Google Sites-hosted, with an interactive profit-shifting data explorer iframed in from GitHub Pages). Use this skill whenever the user asks to edit the homepage text, profit-shifting page text, CV, publication list, build or update the interactive visualization of the JAE 2025 profit shifting data, deploy the viz to GitHub Pages, set up the Stata-to-CSV export pipeline, or improve SEO/findability of the site. Also use when the user mentions "my website", "my homepage", "the viz", "the map", "the profit shifting page", "Stairway to Tax Haven", or any of his papers by name. This skill encodes all the design decisions, text conventions, JRC disclaimer requirements, and data schemas so the site stays consistent across sessions.
---

# Fotis Delis Academic Website — Build & Maintenance Skill

## Who this is for

Fotis Delis — Economist at the European Commission's Joint Research Centre (JRC) in Seville, specializing in international corporate taxation and profit shifting of multinational enterprises. CEPR-affiliated. Published in the *Journal of Accounting and Economics* and *European Accounting Review*.

## Project goal

Keep the user on Google Sites (`https://sites.google.com/view/fotisdelis/home`) for the frame of the website, but make two big improvements:

1. **Cleaner, more engaging text** on the homepage and profit-shifting page (paste-ready markdown/rich-text blocks the user will manually paste into the Google Sites editor).
2. **Interactive data visualization** of the JAE 2025 profit shifting estimates, hosted on GitHub Pages, iframed into the profit-shifting page.

Plus: an updated CV (.docx), better discoverability for academic search, and a reproducible Stata-to-visualization pipeline.

## Critical paths (local machine) and data safety

### Two-folder strategy (strictly enforced)

```
C:\Users\user\Desktop\
├── profit shifting data and cv for website\   ← SOURCE FOLDER (read-only, never git)
│   ├── CV.docx   (or .pdf — the user's existing CV)
│   ├── Table 8_data.dta    ← industry-level estimates
│   └── Table 11_data.dta   ← country-level estimates
│
└── fotisdelis-website\                        ← PROJECT FOLDER (becomes the git repo)
    ├── .claude\skills\fotisdelis-website\SKILL.md
    ├── docs\
    ├── stata\
    ├── ... deliverables ...
    ├── README.md
    └── .gitignore
```

### Why the separation matters (DATA SAFETY — critical)

The source folder contains the user's raw `.dta` files. **These must never be committed to the public GitHub repo.** The derived CSVs (with the same variables, same values) are fine to publish — they're the public data behind the JAE 2025 paper. But the `.dta` files themselves should stay on the user's laptop.

**Rules:**
1. **Never place the source folder inside the project folder.** Keep them as siblings.
2. **Never copy `.dta` files into the project folder.** The Stata `.do` script reads them by absolute path from the source folder and writes CSVs into the project folder.
3. **The `.gitignore` must include `*.dta`, `*.pdf`, `*.docx`** (except for the intended CV deliverable `FotisDelis_CV.docx` — see exception rule below) as a defense-in-depth measure in case a `.dta` ever ends up in the project folder by accident.
4. **Before running `git add`**, always run `git status` and visually confirm no `.dta` or raw CV files are staged.
5. **The CV `.docx` deliverable is intentionally placed in the project root but NOT published to GitHub Pages.** It lives in the git repo (so the user can track versions of their CV), but GitHub Pages only serves `/docs`, so the CV is not publicly discoverable via the Pages URL. However, it IS visible via the GitHub repo UI (`github.com/fntel7/profit-shifting-explorer/blob/main/FotisDelis_CV.docx`). If the user prefers the CV not appear on GitHub at all, move it out of the repo entirely and host it via Google Drive (as the current site does).

### Expected source files
The user has confirmed the source folder contains exactly these three files:
- `CV.docx` (or `.pdf` — check extension)
- `Table 8_data.dta` — industry-level estimates (maps to `industry_data.csv`)
- `Table 11_data.dta` — country-level estimates (maps to `country_data.csv`)

Note the filenames have a space and underscore: `Table 8_data.dta` and `Table 11_data.dta`. Stata paths with spaces work fine when quoted.

## Data schema (authoritative)

The user has confirmed these variables. **Do not rename them in Stata outputs unless you also update every downstream file.**

### Table 11 — country-level (`country_data.csv`)
| Variable | Meaning |
|---|---|
| `year` | Year (2009–2020) |
| `guocountry` | Country of the Global Ultimate Owner (parent) — **full country name, not ISO code** |
| `lowest_tax_country` | Lowest-tax jurisdiction in the MNE group — **full country name** |
| `MNE_profit_shifting` | Profit shifted by MNEs in that (guocountry × lowest_tax_country × year) cell, **in billions of US dollars** |

### Table 8 — industry-level (`industry_data.csv`)
| Variable | Meaning |
|---|---|
| `year` | Year (2009–2020) |
| `Industry` | Broad industry category (GUO's industry) |
| `Nacerev` | NACE Rev. sub-industry code / label (GUO's sub-industry) |
| `MNE_profit_shifting` | Profit shifted, **in billions of US dollars** |

### Interpretation note (must appear on the page)
The estimates are **group-level aggregates, not bilateral flows**. A value for `(US, Cayman Islands, 2018)` means: "total profit shifted by MNEs with a US GUO and at least one subsidiary in the Cayman Islands (where Cayman is the lowest-tax jurisdiction in the group), within the group, in 2018." It does **not** mean "US sent X to Cayman."

## The skill's four deliverables

Execute these in order. Skip/adapt per the user's request.

1. **Homepage text** (`homepage.md`) — paste-ready copy for Google Sites
2. **Profit-shifting page text** (`profit_shifting_page.md`) — paste-ready copy
3. **Interactive visualization** (`docs/index.html` + CSVs) — deployed to GitHub Pages
4. **Updated CV** (`FotisDelis_CV.docx`) — restructured from the existing file

Plus a **Stata export `.do` file** that regenerates the CSVs from the raw `.dta` files.

---

## Deliverable 1 — Homepage text

**Format:** markdown the user will paste block-by-block into Google Sites section layouts.

**Structure (strict):**

### Hero block
- Name: Fotis Delis (Φώτης Ντελής)
- Role one-liner: *Economist · European Commission, JRC Seville · Corporate Taxation & Profit Shifting*
- Icon-link row (user adds images in Google Sites): Google Scholar, SSRN, CEPR, ORCID, JRC profile, LinkedIn, Email, CV
  - Google Scholar: `https://scholar.google.com/citations?user=aDjWfSEAAAAJ&hl=el`
  - SSRN: `https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=4343123`
  - CEPR: `https://cepr.org/about/people/fotis-delis`
  - JRC: `https://joint-research-centre.ec.europa.eu/fotis-delis_en`
  - LinkedIn: `https://www.linkedin.com/in/fotis-delis-5186aa199/`

### About (3–4 sentences, not a wall of text)
Focus on *what he does*, not *where he studied*. Education goes in the CV. Example tone:
> I am an Economist at the Joint Research Centre of the European Commission in Seville, where I build microsimulation models of corporate taxation and study the profit-shifting behaviour of multinational enterprises. My research combines firm-level panel data (Orbis) with nonparametric estimation and quasi-experimental designs to measure how MNEs respond to tax incentives. Recent work appears in the *Journal of Accounting and Economics* and the *European Accounting Review*. I am affiliated with CEPR.

### Selected Research (3 papers, each with a plain-English one-liner)
Pull the hook out of the abstract — why should a non-specialist care?

1. **Global Evidence on Profit Shifting Within Firms and Across Time** (with M.D. Delis, L. Laeven, S. Ongena). *Journal of Accounting and Economics*, 79(2), 2025. [JAE link] [SSRN] [VoxEU column]
   > *We produce firm-level profit-shifting estimates for over 2 million firm-years across 100 countries, 2009–2020 — the first dataset at this granularity.*

2. **Corporate Governance and Profit Shifting: The Role of the Audit Committee** (with M.D. Delis, P. Karavitis, K. Klassen). *European Accounting Review*, 32, 2023. [EAR link]
   > *MNEs with larger audit committees shift more profit — but the relationship flips when committees have audit expertise.*

3. **The Pricing of Profit Shifting** (with M.D. Delis, S. Kokas, L. Laeven, S. Ongena). SSRN 2025, under review.
   > *Equity markets price profit shifting: more-shifting firms earn higher future stock returns, consistent with a premium for regulatory and reputational risk.*

### Work in Progress (bullet list)
- **Stairway to Tax Haven** (solo) — a reconciliation of profit-shifting estimates across methodologies and datasets.
- Democracy, Institutions and International Profit Shifting (with C. Economidou, I. Hasan).
- Banking Beyond Borders: Offshore Dynamics and Profit Shifting in Global Financial Institutions (with R. Speitmann, Y. Wu).
- Decoding Income Tax Systems: Tax Structure and Income Distributions in the EU (with Y. Deli, T. Kakoulidou, S. Ftergioti).

**Remove entirely:** *Profit Shifting and Firm Credit* (user does not plan further work on it).

### News (5–6 dated items, reverse chronological)
Examples (user will edit to match reality):
- *Jul 2025* — VoxEU column summarizing the JAE paper: [link]
- *Jun 2025* — "The Pricing of Profit Shifting" submitted to *Review of Financial Studies*.
- *Mar 2025* — Presented at JRC DiReCT Policy Workshop, Brussels.
- *Jan 2025* — JAE paper published (Vol. 79, issue 2).
- *[add upcoming seminars/conferences]*

### JRC Disclaimer (footer, small)
> *The views expressed on this site are those of the author and do not necessarily reflect those of the European Commission or the Joint Research Centre.*

---

## Deliverable 2 — Profit-shifting page text

**Structure:**

### Intro paragraph (shorter, plain English)
> Within a mainstay model of profit shifting, we employ nonparametric estimation to produce firm-year, MNE-year, industry-year and country-year estimates across more than 100 countries over 2009–2020. The dataset is described in Delis, Delis, Laeven & Ongena (*JAE*, 2025).

Links: JAE, SSRN, VoxEU column, replication materials.

### Interactive explorer
A short sentence introducing the iframe, then the iframe itself:
> Explore the country-year and industry-year estimates in the interactive tool below. *(Group-level aggregates — see note in the tool.)*

```html
<iframe src="https://[user-github-username].github.io/profit-shifting-explorer/"
        width="100%" height="760" frameborder="0"></iframe>
```

### Data downloads
- **Industry-year estimates (Table 8)** — direct CSV download link
- **Country-year estimates (Table 11)** — direct CSV download link
- **Firm-year and MNE-year estimates** — available on request by email (see Contact page). This gating is deliberate: the user wants to screen requests.

Replace the currently-broken Google Drive link.

### Citation block
Give visitors a ready-to-copy citation for the dataset:
```
Delis, F., Delis, M.D., Laeven, L., and Ongena, S. (2025).
"Global Evidence on Profit Shifting Within Firms and Across Time."
Journal of Accounting and Economics, 79(2).
```

### JRC disclaimer (same footer as homepage)

---

## Deliverable 3 — Interactive visualization

### Repository layout
```
profit-shifting-explorer/
├── docs/                          # GitHub Pages serves from /docs
│   ├── index.html                 # the explorer (self-contained, ~500 lines)
│   ├── country_data.csv           # from Stata export of Table 11
│   └── industry_data.csv          # from Stata export of Table 8
├── stata/
│   └── export_for_website.do      # Stata script that regenerates the CSVs
├── README.md
└── .gitignore
```

### Three tabs in the explorer (all in one HTML file)

**Tab 1 — Choropleth world map**
- Controls: dropdown `guocountry` selector, year slider (2009–2020)
- Colors countries of the world by `MNE_profit_shifting` where `lowest_tax_country` = that country, for the selected `guocountry` and year
- Hover: country name + value in $bn
- **Critical UI note** in the info box: explains the group-aggregate interpretation (not bilateral)
- Plotly `choropleth` with `locationmode: "country names"` (matches the full-name strings in the CSV — no ISO conversion needed)

**Tab 2 — GUO country time series**
- Controls: multi-select `guocountry` (up to 6), shows lines 2009–2020
- Y-axis: total `MNE_profit_shifting` summed across all `lowest_tax_country` destinations for that GUO-year
- Plotly line chart

**Tab 3 — Industry ranking**
- Controls: year slider, granularity toggle (`Industry` broad vs `Nacerev` sub-industry), top-N (10/15/20/30)
- Horizontal bar chart ranked by $bn
- Uses `industry_data.csv`

### Technical requirements
- **Single self-contained HTML file.** No build step. Dependencies loaded from CDN:
  - Plotly.js (cdn.plot.ly)
  - PapaParse for CSV (cdn.jsdelivr.net)
- **Responsive** — works in an iframe at 100% width, min-height 760px
- **Color palette:** professional blues (primary `#003d7a`, accent `#1f77b4`), neutral grays. No rainbow, no chartjunk. Diverging scale for the map only if showing net flows.
- **Loading states** and error messages if CSVs fail to load
- **Attribution footer** inside the HTML with the full citation + JRC disclaimer
- **Fonts:** system font stack (`-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`)
- **No tracking/analytics.**

### Edge cases to handle
- Some `guocountry` values will have very few `lowest_tax_country` rows — map should still render (gray out empties)
- Some country names in the CSV may not match Plotly's built-in country list (e.g., "Russia" vs "Russian Federation"). Include a small normalization dictionary in the JS — start with known edge cases and extend as needed:
  ```js
  const countryNameFix = {
    "Russia": "Russian Federation",
    "South Korea": "Korea, Republic of",
    "Czech Republic": "Czechia",
    // add more as they appear
  };
  ```
- Negative values in `MNE_profit_shifting` (inward shifting) exist and should be visualized with a diverging scale on the map

### GitHub Pages deployment steps (for Claude Code to walk the user through)

**User's GitHub username:** `fntel7` (confirmed). Use this in all URLs.

**Required `.gitignore` (write this file before the first `git add`):**
```gitignore
# Raw data — never commit
*.dta
*.dta.gz
*.sav
*.rdata

# Local/OS files
.DS_Store
Thumbs.db
desktop.ini

# Python / test server
__pycache__/
*.pyc
.venv/
venv/

# Editor
.vscode/
.idea/
*.swp

# Local test outputs
*.log
```

**Pre-commit safety check (run every time before committing):**
```bash
git status
# Visually verify NO *.dta files are staged. The only data files should be
# docs/country_data.csv and docs/industry_data.csv (the derived CSVs).
```

**Deployment sequence:**
1. In the project folder, initialize the repo: `git init`
2. Write the `.gitignore` file FIRST (before any `git add`)
3. Create a **new public repo** on GitHub called `profit-shifting-explorer` (at `https://github.com/fntel7/profit-shifting-explorer`)
4. Stage files: `git add .` — then run `git status` to verify no `.dta` files slipped through
5. First commit: `git commit -m "Initial commit: profit shifting explorer"`
6. Set the remote: `git remote add origin https://github.com/fntel7/profit-shifting-explorer.git`
7. Push: `git branch -M main && git push -u origin main`
8. In repo Settings → Pages: set source to `main` branch, folder `/docs`
9. Wait ~1–2 minutes. The site is live at: **`https://fntel7.github.io/profit-shifting-explorer/`**
10. Test the URL in a browser. Check all three tabs work and the iframe height (760px) shows everything without internal scrolling.
11. Paste this URL into a Google Sites "Embed" block on the Profit Shifting page:
    ```html
    <iframe src="https://fntel7.github.io/profit-shifting-explorer/"
            width="100%" height="800" frameborder="0"></iframe>
    ```

---

## Deliverable 4 — Stata pipeline (`export_for_website.do`)

The user wants reproducibility. The `.do` file should:

1. Load `table11.dta` (country) and `table8.dta` (industry)
2. Keep only the variables specified in the schema above
3. Handle encoding (UTF-8 for country names with diacritics)
4. Round `MNE_profit_shifting` to 3 decimal places
5. Drop rows with missing key variables
6. Export CSVs with headers exactly matching the schema
7. Save to `docs/country_data.csv` and `docs/industry_data.csv`

Template (uses the actual filenames the user confirmed):
```stata
* ==================================================================
* export_for_website.do
* Regenerates CSVs consumed by the profit-shifting-explorer
* Author: Fotis Delis
* ==================================================================

version 17
clear all
set more off

* --- Paths ---
* Source files stay in the separate source folder (never in the git repo)
local src "C:/Users/user/Desktop/profit shifting data and cv for website"
* Output goes into docs/ within the project folder (served by GitHub Pages)
local out "docs"
cap mkdir "`out'"

* --- Table 11: country-level ---
use "`src'/Table 11_data.dta", clear
keep year guocountry lowest_tax_country MNE_profit_shifting
drop if missing(year, guocountry, lowest_tax_country, MNE_profit_shifting)
* Strip leading/trailing whitespace from country names (common Stata export issue)
replace guocountry = strtrim(guocountry)
replace lowest_tax_country = strtrim(lowest_tax_country)
replace MNE_profit_shifting = round(MNE_profit_shifting, 0.001)
export delimited using "`out'/country_data.csv", replace

* --- Table 8: industry-level ---
use "`src'/Table 8_data.dta", clear
keep year Industry Nacerev MNE_profit_shifting
drop if missing(year, Industry, Nacerev, MNE_profit_shifting)
replace Industry = strtrim(Industry)
replace Nacerev = strtrim(Nacerev)
replace MNE_profit_shifting = round(MNE_profit_shifting, 0.001)
export delimited using "`out'/industry_data.csv", replace

di as result "Done. CSVs written to `out'/"
```

**Adjust the `.dta` filenames** after reading the user's folder — Claude Code should inspect the actual filenames before finalizing this script.

### Reading the `.dta` files without Stata (important)

Claude Code typically cannot invoke Stata from the command line on the user's Windows machine. Two options for generating the CSVs:

**Option A (preferred): pandas via Python.** Claude Code can read `.dta` files directly with pandas and export CSVs, bypassing Stata entirely. This is fast and reproducible.

```python
import pandas as pd

SRC = r"C:\Users\user\Desktop\profit shifting data and cv for website"
OUT = "docs"

# Table 11 — country
df11 = pd.read_stata(f"{SRC}/Table 11_data.dta")
df11 = df11[["year", "guocountry", "lowest_tax_country", "MNE_profit_shifting"]]
df11 = df11.dropna()
df11["guocountry"] = df11["guocountry"].str.strip()
df11["lowest_tax_country"] = df11["lowest_tax_country"].str.strip()
df11["MNE_profit_shifting"] = df11["MNE_profit_shifting"].round(3)
df11.to_csv(f"{OUT}/country_data.csv", index=False)

# Table 8 — industry
df8 = pd.read_stata(f"{SRC}/Table 8_data.dta")
df8 = df8[["year", "Industry", "Nacerev", "MNE_profit_shifting"]]
df8 = df8.dropna()
df8["Industry"] = df8["Industry"].str.strip()
df8["Nacerev"] = df8["Nacerev"].str.strip()
df8["MNE_profit_shifting"] = df8["MNE_profit_shifting"].round(3)
df8.to_csv(f"{OUT}/industry_data.csv", index=False)
```

**Option B: the `.do` file is still written for the user's reproducibility record**, even if Claude Code uses Option A to generate the initial CSVs. Both approaches yield the same CSVs.

**Recommended workflow:** Claude Code generates the CSVs with Option A (so the viz can be built and tested immediately), and also writes the `.do` file so the user has a Stata-native way to regenerate the CSVs later (e.g., when the underlying `.dta` files are updated).

---

## Deliverable 5 — CV update

### Read the existing CV
Start by reading the CV file in `C:\Users\user\Desktop\profit shifting data and cv for website`. It may be `.docx` or `.pdf`. Use the appropriate tool.

### Apply this structure
Academic economics convention. Arial or Times New Roman, 11pt, 1-inch margins.

1. **Header**: Name, title, affiliation, address, email, phone, web, ORCID, Scholar
2. **Research interests** (2 lines max)
3. **Education** (reverse chronological, degree / institution / year / thesis title)
4. **Academic positions**
5. **Publications** (refereed) — highlight the JAE and EAR with journal rank
6. **Working papers** (include *The Pricing of Profit Shifting*)
7. **Work in progress** (include *Stairway to Tax Haven*)
8. **Policy publications / reports** (JRC outputs)
9. **Presentations / seminars** (by year)
10. **Teaching** (if any)
11. **Referee service** (journals)
12. **Grants and awards**
13. **Professional service / affiliations** (CEPR, etc.)
14. **Languages, technical skills** (Stata, R, SQL, Orbis, etc.)

### Content rules
- **Remove** *Profit Shifting and Firm Credit* from working papers
- **Add** *Stairway to Tax Haven* to work in progress
- Use consistent citation format throughout
- One page is fine if content is sparse; two pages is the sweet spot for an early-career researcher

### Output
- A clean `.docx` using the docx skill (see `/mnt/skills/public/docx/SKILL.md` if available locally)
- Save to project root as `FotisDelis_CV.docx`

---

## Deliverable 6 — SEO & discoverability (no running citation counts)

The user explicitly said: **do not show a running citation count.** He has 56 and considers it modest for stage. Respect this. Instead, optimize findability through these channels:

### On the Google Sites pages
- **Page title** (browser tab): `Fotis Delis — Economist, Profit Shifting & Corporate Taxation`
- **Meta description** (if Google Sites allows, else use it as the first hero-block subtitle): `Economist at the European Commission Joint Research Centre (JRC). Research on profit shifting of multinational enterprises, international corporate taxation, and tax avoidance.`
- **Keywords embedded naturally in body text**: "profit shifting", "multinational enterprises", "corporate tax avoidance", "MNE tax planning", "international corporate taxation", "Orbis firm-level data", "tax havens", "BEPS", "Pillar Two". These are high-value search terms in his subfield.
- **Link anchor text**: use descriptive anchors, e.g., "Download the country-year profit-shifting dataset" rather than "click here"

### Off-site (cheap, high-leverage actions)
The user should verify/update these — instruct Claude Code to generate a checklist file `seo_checklist.md`:
1. **Google Scholar profile** — add personal website URL; verify all papers are claimed; add a good photo
2. **ORCID** — fill in completely, link to website and papers
3. **SSRN author page** — add affiliation, photo, link to website
4. **RePEc author service** — register and claim all papers (currently listed as "Delis, Fotios" / "Fotis Delis" / "DELIS Fotis" across items — consolidate under one ID)
5. **CEPR profile** — add website link if missing
6. **JRC profile** — add website link if missing
7. **LinkedIn** — link website in "Featured" section, post when new papers drop
8. **BlueSky / Twitter/X** — optional but high-leverage for econ/tax Twitter communities
9. **Google Search Console** — submit the sites.google.com URL; verify ownership
10. **ResearchGate** — claim profile, upload accepted manuscripts where copyright allows

### Citation-driving actions (the real way to gain citations)
- Write a short VoxEU-style companion piece for *The Pricing of Profit Shifting* when it clears peer review
- Share the public country-year dataset through Zenodo (gets a DOI, increases discoverability)
- Present at NBER Public Finance, NTA Annual Conference, IIPF — not just European venues
- Tag co-authors on social posts; cross-posting multiplies reach

---

## Style conventions (apply everywhere)

**Tone**
- Concise, confident, factual. No "I am passionate about..." or superlatives.
- Never advertise citation counts, rankings, or h-index.
- Do not use ABS stars inline in the website body — these are for the CV only.

**Formatting**
- Prose in paragraphs; use bullet lists only for publications, talks, news items
- Dates formatted as "Jan 2025", "Jul 2025"
- Author initials with periods: "M.D. Delis", "L. Laeven"
- Journal names italicized

**Links**
- Always open external links in a new tab (`target="_blank"`) in the HTML viz
- SSRN, JAE, EAR links should go to canonical URLs (not paywalled PDFs)

**Images**
- Any chart/figure on the site must include the JRC disclaimer
- Citation under every figure: `Delis et al. (2025), JAE.`

---

## Execution order when invoked fresh

If the user says "build the whole thing" or equivalent, follow this order:

1. **Verify folder structure.** Check that the user is in the project folder (`fotisdelis-website`), NOT in the source folder. If unclear, ask. The project folder should be empty or near-empty at the start.
2. **Confirm source files exist** at `C:\Users\user\Desktop\profit shifting data and cv for website\` — expect exactly three files: `CV.docx` (or `.pdf`), `Table 8_data.dta`, `Table 11_data.dta`. If any are missing, stop and tell the user.
3. **Read the `.dta` files** using `pandas.read_stata()` to confirm the schema matches: Table 11 has `year, guocountry, lowest_tax_country, MNE_profit_shifting`; Table 8 has `year, Industry, Nacerev, MNE_profit_shifting`. Flag any discrepancies before proceeding.
4. **Quick data sanity checks**: print min/max years, count of unique `guocountry` values, count of unique `lowest_tax_country` values, presence of negative values in `MNE_profit_shifting`, any NaN/missing. Share a 2-line summary with the user.
5. **Write `.gitignore` FIRST** before creating any other file (safety).
6. **Create the project folder structure** (`docs/`, `stata/`).
7. **Generate CSVs via pandas** (Option A above) → `docs/country_data.csv` and `docs/industry_data.csv`.
8. **Write the Stata `.do` file** (`stata/export_for_website.do`) so the user has a Stata-native reproducibility path.
9. **Check for country-name mismatches** with Plotly's default country list — scan `lowest_tax_country` and `guocountry` values, flag unknowns, and pre-populate the `countryNameFix` dictionary in the HTML.
10. **Build `docs/index.html`** (the three-tab explorer).
11. **Test locally** — run `python -m http.server 8000` in `docs/` and ask the user to open `http://localhost:8000` in their browser. Fix anything the user reports before deploying.
12. **Produce the paste-ready text files**: `homepage.md` and `profit_shifting_page.md`.
13. **Read the user's existing CV** (`CV.docx` or `CV.pdf` in the source folder) and produce `FotisDelis_CV.docx` in the project root. Use the docx skill. Preserve all factual content; only restructure.
14. **Produce `seo_checklist.md`** and a simple `README.md` for the repo.
15. **Walk through the GitHub Pages deployment** step by step, pausing for the user to confirm each step. Pay special attention to the `git status` safety check.
16. **Final handoff**: provide the iframe URL (`https://fntel7.github.io/profit-shifting-explorer/`) and the exact HTML snippet to paste into Google Sites.

For incremental updates ("add a new paper", "change the map colors"), do just the relevant step.

---

## What NOT to do

- Don't suggest migrating off Google Sites in this skill — that's a separate conversation the user has deferred.
- Don't add a live citation counter.
- Don't add Google Analytics or any tracking.
- Don't rewrite the CV content beyond restructuring — keep all factual content the user provides.
- Don't include "Profit Shifting and Firm Credit" anywhere on the site.
- Don't use ChatGPT-flavored boilerplate ("In today's increasingly globalized economy...").
- Don't invent seminars, talks, or collaborators that aren't in the source material — ask the user.
- Don't quote search results verbatim — paraphrase. The user's own published abstracts and bio can be used directly.

---

## When uncertain, ask

Before writing code or text for anything ambiguous, ask the user a focused question. Good candidates to ask about:

- **Talks/seminars** for the News section — don't invent them
- **"Stairway to Tax Haven" abstract** — one sentence for the website
- **Negative values in `MNE_profit_shifting`** — confirm with user whether these represent inward shifting (profit shifted INTO that guocountry) or a different quantity, so the map legend is labeled correctly
- **Country-name mismatches** — when scanning values, if there are unfamiliar entries (e.g., "British Virgin Islands" vs "Virgin Islands, British"), confirm what Plotly's country list expects and patch the normalization dictionary
- **CV content decisions** — if the existing CV is missing standard sections (e.g., no Talks section), ask whether to leave a placeholder or omit the section
- **Aesthetic preferences** — if color/layout choices are close calls, show 2 quick options rather than guess

What NOT to ask about (these are already decided in this skill):
- Whether to include a citation counter (no)
- Whether to migrate off Google Sites (no, not in this session)
- Whether to include "Profit Shifting and Firm Credit" (no, removed)
- Whether to include the JRC disclaimer (yes, always)

Asking is cheaper than guessing and getting it wrong.
