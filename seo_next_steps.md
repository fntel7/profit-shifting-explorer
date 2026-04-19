# SEO next steps — highest-impact moves, concrete how-to

Four actions with the biggest payoff for discoverability, in order of
effort-adjusted leverage. Each takes 20 minutes or less. Do them in this order.

---

## 1. Consolidate RePEc author profile  ⟶  30 min, free

**Why this matters most.** RePEc is the #1 authoritative aggregator for
economics research. Search engines rank RePEc author pages very highly for
name-plus-topic queries. You're currently listed under at least three
variants: `Delis, Fotios`, `Fotis Delis`, and `DELIS Fotis`. Google treats
those as three different people. Consolidating them into a single author ID
gives you one page with every paper attached, and that page then outranks
everything else when someone searches your name.

**How.**

1. Register with the RePEc Author Service at
   <https://authors.repec.org>.
2. Create an account with the email you use for work (`fotios.ntelis@ec.europa.eu`).
3. In the search box inside your RePEc dashboard, search for **every one of
   your papers** (by title). For each paper that's listed under a different
   name-variant of yours, click **"This is my paper"**.
4. Under **Personal Details**, fill in: affiliation (JRC Seville), website
   (`https://sites.google.com/view/fotisdelis/home`), and your ORCID (after
   step 2 below).
5. Save. RePEc takes a few days to propagate, after which a single canonical
   page at `https://ideas.repec.org/e/pde...n.html` collects all your work.
6. Google re-crawls RePEc within a week or two.

**Check.** A week later, search Google for `"Fotis Delis" profit shifting` —
the RePEc/IDEAS page should appear on the first page.

---

## 2. Create an ORCID and connect it everywhere  ⟶  15 min, free

**Why.** ORCID is the universal author ID. It connects your work across
databases (Scopus, Web of Science, Crossref), and it's the only thing
journals ask for when you submit a paper. Once created, every paper's DOI
resolves to your ORCID, which resolves back to your site.

**How.**

1. Go to <https://orcid.org/register>. Use your work email.
2. In your ORCID profile, add under **Employment**: *European Commission,
   Joint Research Centre, Seville — Economist (2022 – present)*.
3. Add under **Education**: the three degrees (PhD Piraeus, MSc AUEB, BA AUEB).
4. Under **Websites & Social Links**, add:
   - `https://sites.google.com/view/fotisdelis/home`
   - `https://fntel7.github.io/profit-shifting-explorer/`
5. Under **Works → Add works → Search & link**, connect to **Crossref** and
   **DataCite**. ORCID will pull your published papers automatically.
6. Once you have your ORCID ID (format `0000-0000-0000-0000`), paste it:
   - Into your Google Scholar profile
   - Into your SSRN author page
   - Into the RePEc profile from step 1
   - Into the CV (re-run the fotisdelis-website skill with: *"Using the
     skill, add ORCID 0000-... to the CV header and the homepage icon row."*)

**Check.** Search the ORCID ID at `https://orcid.org/[your-id]` — the page
should list both the JRC affiliation and all your papers.

---

## 3. Deposit the public CSVs on Zenodo  ⟶  20 min, free, gets a DOI

**Why this is under-used leverage.** Zenodo is CERN-run; it mints a DOI for
any dataset you upload, and the DOI is indexed by Google Scholar, Google
Dataset Search, DataCite, and OpenAIRE. Every citation of the dataset
becomes a citation you can track. And because you already pointed your
GitHub Pages URL at the CSVs, you can add the site URL as a "related
identifier" — Zenodo surfaces that as a link in the dataset's landing page.

**How.**

1. Go to <https://zenodo.org> and sign in via ORCID (use the ID from step 2).
2. Click **New upload → Upload dataset**.
3. Upload both files from the repo (not the raw `.dta`):
   - `docs/country_data.csv`
   - `docs/industry_data.csv`
4. Fill in the metadata form:
   - **Title:** *Country-year and industry-year profit shifting estimates
     for multinational enterprises, 2009–2020*
   - **Authors:** Delis, Fotis; Delis, Manthos D.; Laeven, Luc; Ongena, Steven
   - **Description:** One paragraph from `profit_shifting_page.md`'s intro.
     Mention that this is the publicly released subset described in the
     JAE 2025 paper, and include the group-level-aggregate interpretation
     note.
   - **Keywords:** `profit shifting`, `multinational enterprises`,
     `corporate tax avoidance`, `tax havens`, `MNE`, `Orbis`, `BEPS`.
   - **Related identifiers:** add
     - `https://doi.org/10.1016/j.jacceco.2024.101744` (type: "is supplement to")
     - `https://fntel7.github.io/profit-shifting-explorer/` (type: "is
       documented by")
   - **Licence:** CC-BY 4.0 (most common for academic data).
   - **Communities:** add "RePEc" if visible.
5. Publish. Zenodo mints a DOI like `10.5281/zenodo.XXXXXXX`.
6. Add that DOI to:
   - The data-downloads block in `profit_shifting_page.md` (future edit —
     ask the skill to add a "Cite the dataset" line)
   - The homepage.md news section (*e.g.* "Dataset deposited on Zenodo —
     DOI: ...")
   - Your Google Scholar, ORCID and RePEc profiles.

**Check.** Two weeks later, search Google Scholar for your dataset title —
it should appear as a separate citable object.

---

## 4. Submit the Google Sites URL to Google Search Console  ⟶  10 min, free

**Why.** Search Console tells Google to crawl your site immediately (rather
than waiting for it to be discovered), shows you which search queries
already land on the site, and surfaces index/crawl errors. It is the single
most informative free tool for any website owner.

**How.**

1. Go to <https://search.google.com/search-console>.
2. Sign in with the same Google account that owns
   `sites.google.com/view/fotisdelis`.
3. **Add property → URL prefix** → paste:
   `https://sites.google.com/view/fotisdelis/home`.
4. Verification: Google Sites properties are auto-verified when you're
   logged in with the owning account. If not, use the Google Analytics or
   HTML-tag method.
5. Once verified, open **URL Inspection** and enter the homepage URL →
   click **Request indexing**. Repeat for the profit-shifting page URL.
6. (Bonus) Add a second property for
   `https://fntel7.github.io/profit-shifting-explorer/` so the explorer is
   also indexed separately.

**Check.** Within 48 hours the **Coverage** report shows which pages are
indexed. Within two weeks, **Performance** shows the actual search queries
people use to land on your site — this is gold for understanding what topics
your potential readers care about.

---

## Rough order-of-magnitude expectations

- After step 1 (RePEc): within 2 weeks, your name searches surface the
  canonical IDEAS page.
- After step 2 (ORCID): everything you publish from now on auto-propagates.
- After step 3 (Zenodo): your dataset becomes independently citable — each
  citation is a new backlink.
- After step 4 (Search Console): you learn what people actually search for.

None of these moves require writing code or touching this repo. They are all
one-time profile cleanups whose payoff compounds over time.
