#' Box plot of wood rats weight for each year based off sex
#'
#' @param dataframe The path to the csv file you want to process
#' @param weight The weight of wood rats in grams
#' @param sex The sex of wood rat, male or female
#' @param year The year the data was recorded
#'
#' @return Box plot of weight of wood rats per year for males and females
#' @export
plot_func = function(dataframe, weight, sex, year){
  dataframe = read_csv("data/surveys.csv") %>%
  select(weight, sex, year) %>%
  replace_with_na_if(.predicate = is.character, condition = ~.x=="Not Recorded") %>%
  na.omit() %>%
  ggplot(mapping = aes(x=sex, y=weight, color=sex)) +
    geom_boxplot(size=.2) +
    labs(x="Year", y="Weight(g)") +
    facet_wrap(facet=vars(year)) +
    scale_y_log10() +
    theme_bw() +
    theme(plot.title = element_text(hjust=.5))
  return(dataframe)
}
