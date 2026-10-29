# Sports closing-price studies (open data)

Game-level data behind the free [Bet Better data studies](https://betbetter.world/studies/): every game's
**no-vig closing probability** next to its **final result**, so anyone can check how well the betting market
priced a season. Each study ships one CSV and the same base-R script reproduces its headline numbers.

| Study | Games | Headline | Write-up | DOI |
|---|---|---|---|---|
| NFL 2026 home field | 97 | Home teams priced at 54.6%, won 47.4% | [nfl-home-field-2026](https://betbetter.world/studies/nfl-home-field-2026) | [10.5281/zenodo.23774214](https://doi.org/10.5281/zenodo.23774214) |
| NHL 2026-27 home ice | 133 | Home teams priced at 52.2%, won 57.1% | [nhl-home-ice-2026](https://betbetter.world/studies/nhl-home-ice-2026) | [10.5281/zenodo.23774011](https://doi.org/10.5281/zenodo.23774011) |
| College football 2026 favourites | 363 | 80%+ favourites won 110 of 117 | [ncaaf-favourites-2026](https://betbetter.world/studies/ncaaf-favourites-2026) | [10.5281/zenodo.23774342](https://doi.org/10.5281/zenodo.23774342) |

More leagues are added as each season's sample grows.

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
