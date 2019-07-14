remotes::install_github("chrk623/dataAnim")
# Master's Thesis project by Charco Hui
library(dataAnim)
gather_anim(
  key = "Subject",
  value = "Score",
  col = c("English", "Maths"),
  data = datoy_wide
)
spread_anim(
  key = "Subject",
  value = "Score",
  data = datoy_long
)