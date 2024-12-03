#' Mean weight of wood rats based off sex and year
#'
#' @param dataframe The path to the csv file you want to process
#' @param weight The weight of wood rats in grams
#' @param sex The sex of wood rats, male or female
#' @param year The year the data was recorded
#'
#' @return Average weight of wood rats for each year of data that was taken based off sex
#' @export
avg_weight = function(dataframe, weight, sex, year){
   dataframe = read_csv("data/surveys.csv") %>%
   replace_with_na_if(.predicate = is.character, condition = ~.x=="Not Recorded") %>%
   na.omit() %>%
   group_by(sex, year) %>%
   select(weight, sex, year) %>%
   summarize(mean=mean(weight)) %>%
   print(n=52)
   return(dataframe)
   }
