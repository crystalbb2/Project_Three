
#' Remove NAs from surveys dataset
#'
#' @param dataframe The path to the csv file you want to process
#' @param weight The weight of wood rats in grams
#'
#' @return surveys dataset with removed NAs and "Not Recorded" values
#' @export
remove_nas = function(dataframe, weight, sex, year){
   dataframe = readr::read_csv("data/surveys.csv") %>%
   naniar::replace_with_na_if(.predicate = is.character, condition = ~.x=="Not Recorded") %>%
   na.omit() %>%
   print(n=200)
   return(dataframe)
     }
