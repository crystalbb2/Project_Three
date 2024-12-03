#' Interaction plot to show correlation between mean weight of wood rats for each year and sex
#'
#' @param dataframe The path to the csv file you want to process
#' @param weight The weight of wood rats in grams
#' @param sex The sex of wood rats, male or female
#' @param year The year the data was recorded
#'
#' @return Interaction plot of mean weight of wood rats per year for males and females
#' @export
interaction_plot = function(dataframe, weight, sex, year){
  dataframe = read_csv("data/surveys.csv") %>%
  group_by(sex, year) %>%
  replace_with_na_if(.predicate = is.character, condition = ~.x=="Not Recorded") %>%
  na.omit() %>%
  summarize(mean_weight = mean(weight)) %>%
  ggplot(mapping = aes(x=year, y=mean_weight, color=sex)) + geom_point() + geom_path(aes(group=sex))
  return(dataframe)
}
