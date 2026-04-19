# Google Sites paste guide — step-by-step

This walks through paste-in of `homepage.md` and `profit_shifting_page.md` into
the Google Sites editor at <https://sites.google.com/view/fotisdelis/home>.

**Before you start**
- Open the site: <https://sites.google.com/view/fotisdelis/home>
- Click the pencil/edit icon (top-right) to open the editor.
- You'll see two panels on the right: **Insert**, **Pages**, **Themes**.
- Google Sites autosaves as you edit. **Publish** in the top-right is what
  pushes changes live.

---

## 0 — Quick orientation

Google Sites uses "sections" (full-width stripes) that contain "blocks"
(text boxes, images, embeds). To add a section: hover below an existing one
and click **+** (or use the layout templates in the Insert panel). To
delete a block: click it and press the trash icon.

**Pasting tip:** when you paste markdown symbols like `**bold**` Google Sites
does NOT interpret them — it shows the asterisks. So paste the **text**
only and use the Sites toolbar (Bold / Italic / Link) to style.

---

## 1 — Homepage setup

Open the **Home** page in the Pages panel if you aren't already there.

### 1a. Hero block (top section)

**Layout:** Use a two-column section. Left column = text. Right column =
your headshot (if you have one; otherwise leave a decorative image or a
coloured block).

**In the left column, text box:**

Line 1 (large title):
```
Fotis Delis (Φώτης Ντελής)
```
Highlight → Heading 1.

Line 2 (subtitle):
```
Economist · European Commission, JRC Seville · Corporate Taxation & Profit Shifting
```
Highlight → Subtitle or Heading 3.

**Below that, insert an icon-link row.** The cleanest way in Google Sites:

1. Insert a small table with 1 row and 7 columns (Insert → Table → 1×7).
2. In each cell, insert an icon image (Insert → Image → Upload, or use a
   Material Icons SVG). Recommended icons: Scholar "G", SSRN document icon,
   CEPR logo, JRC logo, LinkedIn logo, Gmail envelope, PDF icon for CV.
3. Select the image → click the Link icon (chain) → paste the URL from the
   list below.
4. Repeat for each cell.

Icon → URL:

| Icon         | URL |
|---|---|
| Google Scholar | `https://scholar.google.com/citations?user=aDjWfSEAAAAJ&hl=el` |
| SSRN           | `https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=4343123` |
| CEPR           | `https://cepr.org/about/people/fotis-delis` |
| JRC            | `https://joint-research-centre.ec.europa.eu/fotis-delis_en` |
| LinkedIn       | `https://www.linkedin.com/in/fotis-delis-5186aa199/` |
| Email          | `mailto:fotios.ntelis@ec.europa.eu` |
| CV             | (Google Drive shareable link — see step 4 below)           |

After finishing the row, click outside the table, select it, and set the
border to "None" (Table → Table properties) so it looks like a row of icons.

### 1b. About section

Add a new full-width section below the hero. Insert a text block. Paste:

```
I am an Economist at the Joint Research Centre of the European Commission in
Seville, where I build microsimulation models of corporate taxation and study
the profit-shifting behaviour of multinational enterprises. My research
combines firm-level panel data (Orbis) with nonparametric estimation and
quasi-experimental designs to measure how MNEs respond to tax incentives.
Recent work appears in the Journal of Accounting and Economics and the
European Accounting Review.
```

Then italicise the two journal names using the toolbar (select each →
Italic button).

### 1c. Selected Research section

Add a section titled **Selected research** (Heading 2).

Under it, add three text blocks — one per paper. For each paper:

1. **Line 1 — title + authors + venue.** Paste the title, bold it. Paste the
   parenthesised author list and venue. Italicise the journal name.
2. **Line 2 — inline links.** Type the bracketed link labels (JAE, SSRN,
   VoxEU). Highlight each label → Insert Link → paste the URL.
3. **Line 3 — the one-sentence hook.** Italicise the whole line.

Paper 1 URLs:

| Label | URL |
|---|---|
| JAE   | `https://www.sciencedirect.com/science/article/abs/pii/S0165410124000740` |
| SSRN  | `https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4127394` |
| VoxEU | `[paste the exact VoxEU URL when published]` |

Paper 2 URLs:

| Label | URL |
|---|---|
| EAR   | `https://www.tandfonline.com/doi/abs/10.1080/09638180.2021.2003216` |

Paper 3 URLs:

| Label | URL |
|---|---|
| SSRN  | `https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5343521` |
| CEPR (VoxEU) | `https://cepr.org/voxeu/columns/pricing-profit-shifting` |

Full text for each is in `homepage.md` — just copy each paragraph into its
own block, then add the links.

### 1d. Work in progress

Add a section. Use a bulleted list (toolbar → bulleted list):

```
Stairway to Tax Haven (solo) — a reconciliation of profit-shifting estimates
across methodologies and datasets.

Banking Beyond Borders: Offshore Dynamics and Profit Shifting in Global
Financial Institutions (with R. Speitmann, Y. Wu).

Decoding Income Tax Systems: Tax Structure and Income Distributions in the EU
(with Y. Deli, T. Kakoulidou, S. Ftergioti).
```

Bold or italicise the titles as you like.

### 1e. News section

Add a section titled **News** (Heading 2). Use a bulleted list. One item
per line, reverse chronological. Use the italic "date" format:

```
Jan 2025 — "Global Evidence on Profit Shifting Within Firms and Across Time"
published in the Journal of Accounting and Economics (79(2)).

Sep 2022 — Joined the European Commission's Joint Research Centre (JRC) in
Seville as an Economist.
```

Italicise the dates.

**Add 3–4 more dated items** (talks, submissions, presentations) — the
`homepage.md` file left `[TODO]` placeholders for these.

### 1f. Footer (small disclaimer)

Add a narrow full-width section at the very bottom with a text block in
small grey text:

```
The views expressed here are those of the author and do not represent those
of the European Commission or the Joint Research Centre.
```

Set font size to 11–12 px and colour to grey.

### 1g. Set the page title (browser tab)

Google Sites → Settings (gear icon, top-right) → **Settings tab** →
**Brand name**. Leave as "Fotis Delis". Then under **Navigation → Page
title format**, make sure the browser tab reads:

```
Fotis Delis — Economist, Profit Shifting & Corporate Taxation
```

---

## 2 — Profit-shifting page setup

Click the **Pages** panel → find your existing profit-shifting page (or
create a new page called "Profit Shifting").

### 2a. Intro paragraph

Add a text block at the top:

```
Within a mainstay model of profit shifting, we employ nonparametric
estimation to produce firm-year, MNE-year, industry-year and country-year
estimates across more than 100 countries over 2009–2020. The dataset is
described in Delis, Delis, Laeven & Ongena (Journal of Accounting and
Economics, 2025).
```

Italicise the journal name.

### 2b. Related materials (bulleted list)

Add a bulleted list block:

```
Journal of Accounting and Economics (JAE)
SSRN working paper
VoxEU column
Replication materials — [TODO, add when public]
```

Link each item:
- JAE: `https://www.sciencedirect.com/science/article/abs/pii/S0165410124000740`
- SSRN: `https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4127394`
- VoxEU: `[paste the URL]`

### 2c. Interactive explorer — the iframe

This is the important one. Add a new section below the intro. Give it a
Heading 2 label: **Interactive explorer**.

Then **Insert → Embed → Embed code** (not URL — you want the `<iframe>`
tag to be used verbatim). Paste:

```html
<iframe src="https://fntel7.github.io/profit-shifting-explorer/"
        width="100%" height="1000" frameborder="0"
        style="border: 0;"></iframe>
```

Click **Insert**. You'll see a small preview. Drag the handles of the
embed block so it spans the full width of the section and has at least
800 px of height. If the inner content scrolls inside the iframe, edit
the embed and bump `height` to `900` or `1000`.

Just above the iframe, add a one-line text block:

```
Explore the country-year and industry-year estimates in the interactive tool
below. (Group-level aggregates — see the "How to read" note inside the tool.)
```

### 2d. Data downloads

Add a section titled **Data downloads**. Use a bulleted list. Link each
label to the CSV:

```
Country-year estimates (Table 11)   →  https://fntel7.github.io/profit-shifting-explorer/country_data.csv
Industry-year estimates (Table 8)   →  https://fntel7.github.io/profit-shifting-explorer/industry_data.csv
Firm-year and MNE-year estimates    →  "available on request by email (see Contact)"
```

Delete the existing broken Google Drive link on this page — the two CSV
links above replace it.

### 2e. Citation block

Add a text block with a **monospace / code** style (Google Sites has a
"Code" format in the toolbar). Paste:

```
Delis, F., Delis, M.D., Laeven, L., and Ongena, S. (2025).
"Global Evidence on Profit Shifting Within Firms and Across Time."
Journal of Accounting and Economics, 79(2).
```

### 2f. Interpretation note

Add a grey / callout-style text block (Sites has a "Highlight" style you
can use, or just pick a light grey colour):

```
The estimates are group-level aggregates over (GUO country × lowest-tax
country × year) combinations, not bilateral flows. A value for
(United States, Cayman Islands, 2018) means: total profit shifted by MNEs
whose Global Ultimate Owner is in the United States and whose lowest-tax
jurisdiction in the group is the Cayman Islands, in 2018. It does not mean
"the US sent X to the Cayman Islands."
```

### 2g. Footer (same as homepage)

Same grey disclaimer line as §1f. Google Sites lets you set a site-wide
footer once (Settings → Footer) — use that so you don't have to paste it
on each page.

---

## 3 — Test

In the editor, click **Preview** (eye icon, top-right). Check:

- [ ] Hero block: icons align, all seven links open the right destination.
- [ ] Text is readable — no stray `*` asterisks left over from markdown.
- [ ] Paper titles are linked.
- [ ] The iframe loads the explorer, all three tabs work, and the map
      bubbles are visible.
- [ ] CSV download links return files (a small CSV popup preview).

If anything is broken, fix it in the editor, then re-preview.

---

## 4 — Upload the CV to Google Drive

1. Go to <https://drive.google.com>.
2. **Upload** `C:\Users\user\Desktop\fotisdelis-website\FotisDelis_CV.docx`.
3. Right-click the uploaded file → **Share** → **"Anyone with the link"**
   → **Viewer** → **Copy link**.
4. In Google Sites, select the CV icon in the hero row → **Insert Link**
   → paste the copied URL.

The CV will now download/open for anyone who clicks the icon.

---

## 5 — Publish

Top-right of the Sites editor: click **Publish**. First time Google asks
you to confirm the domain — keep it as `sites.google.com/view/fotisdelis`.

**Publish scope:** leave as "Anyone can find and view".

After publishing, open the public URL in a private/incognito window and
re-do the tests in step 3 — this catches things that only show up for
logged-out visitors (like embed permissions).

---

## 6 — A note on the iframe height

If the explorer feels cramped, or the internal scrollbar is ugly:

1. Edit the iframe embed.
2. Change `height="1000"` to `height="900"` or `1000`.
3. Save and re-publish.

The explorer is responsive, so width will always track the section. Only
height needs manual tuning.
