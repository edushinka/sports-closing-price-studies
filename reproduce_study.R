# Reproduce a Bet Better closing-price study from its CSV (base R only, no packages).
# Usage:  Rscript reproduce_study.R data/nfl_2026_closing_prices_vs_results.csv
# Each row is one game: the home team's no-vig closing probability (each book's margin removed,
# averaged across books) and whether the home team won. The script reports home field priced vs
# actual with a bootstrap 95% range, the Brier score of the closing prices, and favourites by
# price band. Write-ups: https://betbetter.world/studies/

args <- commandArgs(trailingOnly = TRUE)
path <- if (length(args) >= 1) args[1] else "data/nfl_2026_closing_prices_vs_results.csv"
d <- read.csv(path, stringsAsFactors = FALSE)
stopifnot(all(c("home_no_vig_close_prob", "home_won") %in% names(d)))

p <- d$home_no_vig_close_prob
y <- d$home_won
n <- nrow(d)
pct <- function(x) sprintf("%.1f%%", 100 * x)

cat(sprintf("File: %s\nGames: %d (%s to %s)\n\n", basename(path), n, min(d$date_utc), max(d$date_utc)))

# 1. Home field: priced vs actual
gap <- mean(y) - mean(p)
set.seed(2026)
boot <- replicate(4000, { i <- sample.int(n, n, replace = TRUE); mean(y[i]) - mean(p[i]) })
ci <- quantile(boot, c(0.025, 0.975))
cat(sprintf("Home teams priced to win %s, won %s (%d of %d)\n", pct(mean(p)), pct(mean(y)), sum(y), n))
cat(sprintf("Gap %+.1f points, bootstrap 95%% range %+.1f to %+.1f\n\n", 100 * gap, 100 * ci[1], 100 * ci[2]))

# 2. Brier score (a coin flip scores 0.250)
cat(sprintf("Brier score of closing prices: %.4f (expected if prices were exactly right: %.4f)\n\n",
            mean((p - y)^2), mean(p * (1 - p))))

# 3. Favourites by price band
fav_p <- pmax(p, 1 - p)
fav_won <- ifelse(p >= 0.5, y, 1 - y)
bands <- cut(fav_p, c(0.5, 0.55, 0.6, 0.65, 0.7, 0.8, 0.9, 1.0001), right = FALSE,
             labels = c("50-55%", "55-60%", "60-65%", "65-70%", "70-80%", "80-90%", "90%+"))
tab <- do.call(rbind, lapply(split(seq_len(n), bands), function(i) {
  if (!length(i)) return(NULL)
  data.frame(games = length(i), priced = pct(mean(fav_p[i])), won = pct(mean(fav_won[i])), lost = sum(1 - fav_won[i]))
}))
cat("Favourites by closing price:\n")
print(tab)
cat(sprintf("\nAll favourites: priced %s, won %s\n", pct(mean(fav_p)), pct(mean(fav_won))))
