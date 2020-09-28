# Austin Wilkins
# Renaming Files
# Sept 28, 2020


# working directory is in a folder,
# pdfs are in a folder within the directory called "Bankingcopy"
# index_editorials is in the directory


library(openxlsx)
library(tidyverse)


#Set working directory as formatted above
getwd()
setwd("/Users/rswells/Dropbox/Current_Projects/Kiplinger article/History Context Journalism Business Culture/NYT coverage/Bankingcopy")

#List files, exploring around
list.files()
list.files("/Users/rswells/Dropbox/Current_Projects/Kiplinger article/History Context Journalism Business Culture/NYT coverage/Bankingcopy")


#get index list
index <-read.xlsx('/Users/rswells/Dropbox/Current_Projects/Kiplinger article/History Context Journalism Business Culture/NYT coverage/index_editorials.xlsx')


#get the pdf file names
files <- data.frame(list.files("/Users/rswells/Dropbox/Current_Projects/Kiplinger article/History Context Journalism Business Culture/NYT coverage/Bankingcopy"))
#files <- data.frame(list.files())
#and rename column (just for ease)
names(files) <- "names"

#extract the numbers to a new column
files$number <- files$names %>% str_extract('^\\d+')

glimpse(index)
glimpse(files)

#parse through, if the file$number is in index$StoreId, then copy it to working directory with a new name
# Change the end of line 43 "paste0(index$Index[i],".pdf")" to change the target file name or location

for (i in 1:length(files$number)){
  if(files$number[i] %in% index$StoreId){
    
    file.copy(paste0('Bankingcopy/',list.files("Bankingcopy")[i]),paste0(index$Index[i],".pdf"))
  }
  print(paste0(i," not found"))
}


for (i in 1:length(files$number)){
  if(files$number[i] %in% index$StoreId){
    
    file.copy(paste0('/Users/rswells/Dropbox/Current_Projects/Kiplinger article/History Context Journalism Business Culture/NYT coverage/Bankingcopy/',list.files("/Users/rswells/Dropbox/Current_Projects/Kiplinger article/History Context Journalism Business Culture/NYT coverage/Bankingcopy")[i]),paste0(index$Index[i],"/Users/rswells/Dropbox/Current_Projects/Kiplinger article/History Context Journalism Business Culture/NYT coverage/Bankingcopy"))
  }
  print(paste0(i," not found"))
}

