
#' Remove NAs from dataset
#'
#' @param dataframe The path to the csv file you want to process
#' @param weight The weight of woodrats in grams
#'
#' @return surveys dataset with removed NAs
#' @export
#'
#' @examples
remove_nas = function(dataframe, weight){
   dataframe = readr::read_csv("data/surveys.csv")
   naniar::replace_with_na_if(.predicate = is.character, condition = ~.x=="Not Recorded") %>%
   na.omit()}
