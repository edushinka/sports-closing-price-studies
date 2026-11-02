# Sports closing-price studies (open data)

Game-level data behind the free [Bet Better data studies](https://betbetter.world/studies/): every game's
**no-vig closing probability** next to its **final result**, so anyone can check how well the betting market
priced a season. Each study ships one CSV and the same base-R script reproduces its headline numbers.

| Study | Games | Headline | Write-up | DOI |
|---|---|---|---|---|
| NFL 2026 home field | 97 | Home teams priced at 54.6%, won 47.4% | [nfl-home-field-2026](https://betbetter.world/studies/nfl-home-field-2026) | [10.5281/zenodo.23774214](https://doi.org/10.5281/zenodo.23774214) |
| NHL 2026-27 home ice | 133 | Home teams priced at 52.2%, won 57.1% | [nhl-home-ice-2026](https://betbetter.world/studies/nhl-home-ice-2026) | [10.5281/zenodo.23774011](https://doi.org/10.5281/zenodo.23774011) |
| College football 2026 favourites | 363 | 80%+ favourites won 110 of 117 | [ncaaf-favourites-2026](https://betbetter.world/studies/ncaaf-favourites-2026) | [10.5281/zenodo.23774342](https://doi.org/10.5281/zenodo.23774342) |

### Wave 2 (30-Oct-2026): every league with an honest sample

| Study | Games | Write-up | CSV |
|---|---|---|---|
| NBA Back-to-Backs: Tired Teams Won 42.5% of 1,472 Games | 5,897 | [nba-back-to-backs-2021-2026](https://betbetter.world/studies/nba-back-to-backs-2021-2026) | `data/nba_2021_2026_closing_prices_vs_results.csv` |
| MLB 2026: Underdogs Won 42.6% of 2,163 Games | 2,163 | [mlb-favourites-2026](https://betbetter.world/studies/mlb-favourites-2026) | `data/mlb_2026_closing_prices_vs_results.csv` |
| ATP Tennis: Big Grand Slam Favourites Lost Only 19 of 256 | 1,722 | [tennis-atp-favourites-2024-2026](https://betbetter.world/studies/tennis-atp-favourites-2024-2026) | `data/atp_2024_2026_closing_prices_vs_results.csv` |
| WTA Tennis 2024-2026: Favourites Priced at 69.6% Won 70.5% | 1,777 | [tennis-wta-favourites-2024-2026](https://betbetter.world/studies/tennis-wta-favourites-2024-2026) | `data/wta_2024_2026_closing_prices_vs_results.csv` |
| UFC Favourites Won 70.1% of 1,496 Fights, More Than the Odds Said | 1,496 | [ufc-favourites-2023-2026](https://betbetter.world/studies/ufc-favourites-2023-2026) | `data/ufc_2023_2026_closing_prices_vs_results.csv` |
| NRL 2022-2026: Slight Favourites Won 126 and Lost 126 | 921 | [nrl-favourites-2022-2026](https://betbetter.world/studies/nrl-favourites-2022-2026) | `data/nrl_2022_2026_closing_prices_vs_results.csv` |
| AFL 2026: Big Favourites Won 52 of 53 | 212 | [afl-favourites-2026](https://betbetter.world/studies/afl-favourites-2026) | `data/afl_2026_closing_prices_vs_results.csv` |
| WNBA 2026: The Washington Mystics Won 29 Games. The Odds Expected 22. | 353 | [wnba-favourites-2026](https://betbetter.world/studies/wnba-favourites-2026) | `data/wnba_2026_closing_prices_vs_results.csv` |
| MLS 2026: 31.9% of Games Were Draws. The Odds Said 23.6%. | 430 | [soccer-draws-2026](https://betbetter.world/studies/soccer-draws-2026) | `data/soccer_2026_closing_prices_vs_results.csv` |
| College Basketball 2024-25: Home Teams Won 66.1%, More Than the Odds Said | 949 | [college-basketball-home-court-2024-25](https://betbetter.world/studies/college-basketball-home-court-2024-25) | `data/ncaab_2024_25_closing_prices_vs_results.csv` |
| Cricket: ODI Favourites Won 58.8%. The Odds Said 65.0%. | 424 | [cricket-favourites-2023-2026](https://betbetter.world/studies/cricket-favourites-2023-2026) | `data/cricket_2023_2026_closing_prices_vs_results.csv` |

UFC, ATP and WTA have no home side: `home_team` is the alphabetically first competitor, so the home-field line reads about zero by design and the favourite bands are exact. Cricket `home_team` is the side the books list first. Soccer adds `draw_no_vig_close_prob`, `away_no_vig_close_prob` and `draw`.

More leagues are added as each season's sample grows.

## Beyond closing-price calibration

These three files have their own columns (see the header row of each CSV and the write-up).

| Study | Rows | Headline | Write-up | DOI | CSV |
|---|---|---|---|---|---|
| NFL starters out 2021-2024 | 577 team-games | Without the starting QB: 75-150-1, margin -3.1, spread moved 3.1 | [nfl-injuries-starters-2021-2024](https://betbetter.world/studies/nfl-injuries-starters-2021-2024) | [10.5281/zenodo.23879869](https://doi.org/10.5281/zenodo.23879869) | `data/nfl_starters_out_2021_2024.csv` |
| NBA defense vs position 2018-2025 | 6,360 | Guards +0.51 points against the five easiest defenses | [nba-defense-vs-position-2018-2025](https://betbetter.world/studies/nba-defense-vs-position-2018-2025) | [10.5281/zenodo.23879979](https://doi.org/10.5281/zenodo.23879979) | `data/nba_defense_vs_position_2018_2025.csv` |
| NFL weather and scoring 2021-2026 | 997 | 15+ mph wind: 40.3 points vs 44.7, closing total down about 1 | [nfl-weather-scoring-2021-2026](https://betbetter.world/studies/nfl-weather-scoring-2021-2026) | [10.5281/zenodo.23880021](https://doi.org/10.5281/zenodo.23880021) | `data/nfl_weather_scoring_2021_2026.csv` |

R walkthroughs: [NFL wind and scoring](https://rpubs.com/betbetter/nfl-wind-scoring-r), [NBA defense vs position](https://rpubs.com/betbetter/nba-defense-vs-position-r).

## Columns

| Column | Meaning |
|---|---|
| `date_utc` | Game date (UTC) |
| `week` | Week of the season |
| `home_team`, `away_team` | Teams |
| `home_no_vig_close_prob` | Home team's chance implied by closing moneylines, each book's margin removed, averaged across books (3+ books per game) |
| `home_won` | 1 if the home team won, else 0 (ties count as 0) |
| `home_score`, `away_score` | Final score |
| `n_books` | Number of sportsbooks averaged |

## Reproduce

```r
Rscript reproduce_study.R data/nhl_2026_closing_prices_vs_results.csv
```

Prints home field priced vs actual with a bootstrap 95% range (4,000 resamples), the Brier score of the
closing prices, and favourites by price band. Base R only. Bootstrap ranges can differ by a few tenths of a
point from the write-ups because of the random seed.

## Method

Closing moneylines from The Odds API (US and international books); for each book the two prices are turned
into chances and scaled to add up to 100% (the bookmaker's margin removed), then averaged per game. Final
scores from ESPN. Regular-season games only.

## Licence and credit

Data: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Code: MIT. Please credit
**Bet Better** with a link to [betbetter.world/studies](https://betbetter.world/studies/). Cite with the DOI
of each dataset or the `CITATION.cff` file.
