#' Multiplies hindfoot length and weight
#'
#' @param dataframe The path to the tab-delimited file you want to process
#' @param hindfoot_length The length of wood rats' hindfoot in mm
#' @param weight The weight of wood rats in grams
#'
#' @return Error message for numbers greater than 5500
#' @export
new_function2 = function(dataframe, hindfoot_length, weight){
  dataframe = read_csv("data/surveys.csv") %>%
    select(hindfoot_length, weight) %>%
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
results = new_function2(surveys, hindfoot_length, weight)
