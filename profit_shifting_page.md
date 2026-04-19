# Profit-shifting page — paste-ready blocks for Google Sites

> **How to use this file.** Paste each block into the matching Google Sites section.
> The interactive explorer goes in via an Embed block (Insert → Embed → Embed code).
> Replace `[TODO]` items before publishing.

---

## Intro

Within a mainstay model of profit shifting, we employ nonparametric estimation to
produce firm-year, MNE-year, industry-year and country-year estimates across more
than 100 countries over 2009–2020. The dataset is described in Delis, Delis, Laeven &
Ongena (*Journal of Accounting and Economics*, 2025).

**Paper and related materials:**

- [Journal of Accounting and Economics (JAE)](https://doi.org/10.1016/j.jacceco.2024.101744)
- [SSRN working paper](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4127394)
- [VoxEU column](https://cepr.org/voxeu) `[TODO – paste the exact VoxEU URL]`
- Replication materials: `[TODO – link when public]`

---

## Interactive explorer

Explore the country-year and industry-year estimates in the interactive tool below.
*(Group-level aggregates — see the "How to read" note inside the tool.)*

**Paste this into a Google Sites "Embed code" block:**

```html
<iframe src="https://fntel7.github.io/profit-shifting-explorer/"
        width="100%" height="1000" frameborder="0"
        style="border: 0;"></iframe>
```

**Important:**
1. In Google Sites, after pasting in the embed code, **drag the bottom
   handle of the embed block down** until it is about 1000 px tall. The
   `height="1000"` attribute sets the iframe size, but the block container
   in Sites is sized separately — if the container is shorter, the iframe
   gets clipped.
2. Embeds are **not interactive in the Sites editor** — they show a static
   placeholder. To test the map/controls, click **Preview** (eye icon,
   top-right) or **Publish** and open the live page.

---

## Data downloads

- **Country-year estimates (Table 11)** — [Download CSV](https://fntel7.github.io/profit-shifting-explorer/country_data.csv)
- **Industry-year estimates (Table 8)** — [Download CSV](https://fntel7.github.io/profit-shifting-explorer/industry_data.csv)
- **Firm-year and MNE-year estimates** — available on request by email (see Contact). `[This gating is deliberate — requests are screened.]`

> Replace any old / broken Google Drive link on the current Google Sites page with
> the two CSV links above.

---

## Citation

Please cite the paper when using the public estimates:

```
Delis, F., Delis, M.D., Laeven, L., and Ongena, S. (2025).
"Global Evidence on Profit Shifting Within Firms and Across Time."
Journal of Accounting and Economics, 79(2).
```

---

## Interpretation note

The estimates are **group-level aggregates over (GUO country × lowest-tax country × year)
combinations**, not bilateral flows. A value for, say, `(United States, Cayman Islands, 2018)`
means: total profit shifted by MNEs whose Global Ultimate Owner is in the United States
*and* whose lowest-tax jurisdiction in the group is the Cayman Islands, in 2018. It does
not mean "the US sent X to the Cayman Islands."

---

## Footer (small)

*The views expressed here are those of the author and do not represent those of the
European Commission or the Joint Research Centre.*
