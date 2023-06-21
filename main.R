# flash card function
# functionality
# take in a csv or parquet
# give first a random word and then when prompted again give the "translation"
source("config.R")

data <- read.table(file = path, header = TRUE, sep = ";", encoding = "UTF-8")

run_flashcards <- function(){
    rounds <- NA
    while(is.na(rounds)){
        rounds <- readline("How many rounds would you like to do?: ")
        rounds <- as.numeric(rounds)
        if(is.na(rounds)){print("Please choose a number")}
    }
    print(paste0("We will do ",rounds," rounds."))
    
    if(reverse == FALSE){
        for(i in 1:rounds){
        selected <- sample(x = 1:nrow(data), size = 1)
        answer <- readline(paste0(data[selected, 1], "\nYour answer: "))
        print(paste0("The correct answer is ", data[selected, 2]))
        }
    }
    
    if(reverse == TRUE){
        for(i in 1:rounds){
            selected <- sample(x = 1:nrow(data), size = 1)
            answer <- readline(paste0(data[selected, 2], "\nYour answer: "))
            print(paste0("The correct answer is ", data[selected, 1]))
        }
    }
}
