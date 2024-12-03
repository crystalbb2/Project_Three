#' Linear Model of mean weight of wood rats based on sex and year
#'
#' @param dataframe The path the csv file you want to process
#' @param weight The weight of wood rats in grams
#' @param sex The sex of wood rats, male or female
#' @param year The year the data was recorded
#'
#' @return Linear model of data for mean weight of wood rats based off year and sex
#' @export
linear_model = function(dataframe, weight, sex, year){
  dataframe = read_csv("data/surveys.csv") %>%
    select(weight, sex, year) %>%
    replace_with_na_if(.predicate = is.character, condition = ~.x== "Not Recorded") %>%
    na.omit()
    lm_result = lm(formula = weight ~ sex + year, data = dataframe)
    sum_lm  = summary(lm_result)
    return(sum_lm)
}
