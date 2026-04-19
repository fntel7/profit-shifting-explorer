# fotisdelis-website / profit-shifting-explorer

Source for the interactive profit-shifting explorer embedded in
[Fotis Delis's academic site](https://sites.google.com/view/fotisdelis/home),
plus the paste-ready text blocks for the Google Sites pages and an updated CV.

The explorer is based on the country-year and industry-year estimates from:

> Delis, F., Delis, M.D., Laeven, L., and Ongena, S. (2025).
> *Global Evidence on Profit Shifting Within Firms and Across Time.*
> Journal of Accounting and Economics, 79(2).

## Live

GitHub Pages: <https://fntel7.github.io/profit-shifting-explorer/>

## Repo layout

```
fotisdelis-website/
├── docs/                     # served by GitHub Pages
│   ├── index.html              # self-contained Plotly + PapaParse explorer
│   ├── country_data.csv        # Table 11 — country-level estimates
│   └── industry_data.csv       # Table 8 — industry-level estimates
├── stata/
│   └── export_for_website.do   # regenerates the CSVs from the raw .dta
├── homepage.md                 # paste-ready Google Sites homepage text
├── profit_shifting_page.md     # paste-ready Google Sites profit-shifting page text
├── seo_checklist.md            # off-site discoverability checklist
├── README.md
└── .gitignore                  # excludes *.dta, *.pdf, *.docx

```

## Data pipeline

The raw `.dta` files live **outside** this repo (they are not committed). Two paths
produce the same CSVs:

- **pandas** (fast, used for the initial build): `python _export_csvs.py` reads the
  two `.dta` files from the source folder and writes the CSVs into `docs/`.
- **Stata** (reproducibility path): `stata/export_for_website.do` does the same
  thing in Stata.

Both yield identical CSVs.

## Explorer features

Three tabs in a single `docs/index.html`:

1. **Map** — choropleth + overlay bubbles of the lowest-tax jurisdictions for the
   chosen GUO country and year. Top-5 GUOs only (US, Japan, UK, Germany, France).
   Bubbles ensure small-island tax havens remain visible.
2. **GUO · lowest-tax pairs** — time series for the top-20 (GUO × lowest-tax)
   combinations by all-time total, 2009–2020. Up to 6 lines at a time.
3. **Industry ranking** — top 10 industries by profit shifted, for a chosen year,
   at NACE section or NACE sub-class granularity.

No tracking, no analytics. Plotly and PapaParse are loaded from their CDNs.

## Local development

```bash
cd docs
python -m http.server 8000
# open http://localhost:8000
```

## Data safety

- Raw `.dta` files never enter this repo. The `.gitignore` blocks `*.dta`, `*.pdf`,
  and `*.docx` (with an exception for the single intended CV deliverable).
- Always run `git status` before `git add` and confirm no `.dta` files are staged.

## Disclaimer

The views expressed here are those of the author and do not represent those of the
European Commission or the Joint Research Centre.
