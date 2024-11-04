#' Multiply hindfoot length and weight of woodrats
#'
#' @param dataframe The path to the csv file you want to process
#' @param hindfoot_length The length of wood rats hindfoot in mm
#' @param weight The weight of wood rats in grams
#'
#' @return Error message for numbers greater than 5500 after using equation
#' @export
new_function2 = function(dataframe, hindfoot_length, weight){
  dataframe = readr::read_csv("data/surveys.csv") %>%
    dplyr::select(hindfoot_length, weight) %>%
    filter(!is.na(hindfoot_length)) %>%
    filter(!is.na(weight))
  result = dataframe$hindfoot_length*dataframe$weight
  result = na.omit(result)
  print(result)
  for (r in result){
    if (r > 5500){
      message(paste("That's too big", r))
    }
  }
  return(result)
}
