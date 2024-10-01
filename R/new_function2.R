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