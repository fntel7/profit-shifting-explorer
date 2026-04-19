# Prompts for future Claude Code sessions

Open Claude Code inside `C:\Users\user\Desktop\fotisdelis-website`:

```powershell
cd C:\Users\user\Desktop\fotisdelis-website
claude
```

Then paste **one** of the prompts below, depending on what you want to do.
The `fotisdelis-website` skill is already installed at
`.claude\skills\fotisdelis-website\SKILL.md`, so every prompt below simply
says *"use the skill"* — Claude Code will load it and follow the data-safety
rules, colour palette, disclaimer wording, and layout conventions automatically.

---

## 1) Data refresh — re-run the pipeline after you updated the .dta files

Use this whenever the two `.dta` files in the source folder change
(new year, revised estimates, etc.).

```
Using the fotisdelis-website skill, refresh the data:
- Re-read Table 8_data.dta and Table 11_data.dta from
  C:\Users\user\Desktop\profit shifting data and cv for website\
- Print a data summary first (year range, row counts, any new guocountry or
  lowest_tax_country values not seen before — flag those explicitly).
- If there are new country names, update the countryNameFix dictionary in
  docs/index.html so the map covers them. Also add centroids for any new
  lowest_tax_country values.
- Recompute the top-5 GUOs and the top-20 (GUO × lowest-tax) pairs.
- Regenerate docs/country_data.csv and docs/industry_data.csv via pandas.
- Start a local server in docs/ so I can test, then pause.
- After I approve, commit with a message like "Data refresh: <year> vintage"
  and push. Before git add, run git status and confirm no .dta files are
  staged.
```

---

## 2) Add a new tab to the explorer

Template — replace the italic bracketed parts with what you actually want.

```
Using the fotisdelis-website skill, add a new tab to docs/index.html.

Tab name: "[Top MNEs]"
What it shows: [horizontal bar chart of the top 15 MNEs by MNE_profit_shifting
                for a chosen year; dropdown for year; CSV used is a new
                docs/mne_data.csv that I will drop in]
Controls: [year slider + top-N selector]
Colours: match the existing red/orange palette — do not switch to blues.

Steps:
- Read the new CSV and print a 2-line summary (columns, row count, year range).
  Pause for my sign-off before writing code.
- Add the tab button, panel, and render function in docs/index.html only
  (keep everything self-contained, no build step).
- Keep the existing three tabs and their behaviour unchanged.
- Start a local server so I can test, then wait for me before deploying.
```

---

## 3) Edit page text (homepage or profit-shifting page)

```
Using the fotisdelis-website skill, update homepage.md:
- Add this news entry dated [Month Year]: "[full text with link]"
- [any other edit]

Keep the JRC disclaimer wording exactly as it is (no "necessarily").
Don't touch the other sections.
After the edit, show me a short diff and stop — I'll paste the updated block
into Google Sites myself.
```

---

## 4) Add a paper / update the CV

```
Using the fotisdelis-website skill, I want to:
- Add a new paper: "[title]" (with [co-authors]), [status: working paper / published],
  [venue + year if published], [link].
- Update homepage.md → Selected Research or Work in progress as appropriate.
- Update FotisDelis_CV.docx accordingly (Times New Roman 12pt, plain caps
  section headers, clickable hyperlinks). Keep the CV out of the git repo —
  *.docx is in .gitignore and stays that way.
- Leave the .do file alone.

Before writing, read the existing homepage.md and the current CV so you don't
drop anything. Show me a diff or a short plan before making changes.
```

---

## 5) Update the local server to test

```
Start a local server on port 8000 in docs/ so I can test the explorer at
http://localhost:8000 — using the fotisdelis-website skill context.
```

---

## 6) Change the map colours, industry top-N, or other viz defaults

```
Using the fotisdelis-website skill, in docs/index.html:
- Change [what] to [what].
- Keep the no-arrow / no-direction rule (the data is not directional).
- Re-test locally, then when I approve, commit and push.
```

---

## Safety rules that always apply (the skill enforces these)

1. `.gitignore` must keep `*.dta`, `*.pdf`, `*.docx` excluded. Never commit
   the raw .dta files or the CV.
2. Before every `git add`, run `git status` and confirm no `.dta` or
   `FotisDelis_CV.docx` is staged.
3. The source .dta files live in
   `C:\Users\user\Desktop\profit shifting data and cv for website\` and
   must stay there — they're read by absolute path, never copied into
   the repo.
4. The profit-shifting data is not directional: no arrows, no "from / to",
   no flow language. See the feedback memory
   `feedback_profit_shifting_framing.md`.
5. JRC disclaimer: "The views expressed here are those of the author and
   do not represent those of the European Commission or the Joint Research
   Centre." Do not use the word "necessarily".
6. Deploy path:
   - test locally via `python -m http.server 8000` in `docs/`
   - `git status` → `git add .` → `git status` again → `git commit` → `git push`
   - GitHub Pages serves `/docs` on the `main` branch, live at
     https://fntel7.github.io/profit-shifting-explorer/

---

## Tip

If you want a quick sanity check on the live site after a push, ask:

```
Curl https://fntel7.github.io/profit-shifting-explorer/ and the two CSVs
and confirm HTTP 200 on all three.
```
