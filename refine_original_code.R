library(dplyr)
library(rawdata)
setwd("/Users/yumichoi/Desktop/Springboard")

# 1: Clean up brand names
 rawdata$company<- tolower(rawdata$company)
 rawdata$company[rawdata$company == "phillips"] <- "philips"
 rawdata$company[rawdata$company == "akz0"] <- "akzo"
 rawdata$company[rawdata$company == "ak zo"] <- "akzo"
 rawdata$company[rawdata$company == "fillips"] <- "philips"
 rawdata$company[rawdata$company == "phlips"] <- "philips"
 rawdata$company[rawdata$company == "unilver"] <- "unilever"

 # 2: Separate product code and number
 rawdata <- separate(rawdata, 'Product code / number', into = c("product code","number"), sep = "-", remove = TRUE)

 # 3: Add product categories  --// COULDN'T FIGURE OUT YET.. POSTED IT ON Q&A :(

 # 4: Add full address for geocoding
 rawdata <- rawdata %>% 
   mutate(full_address = paste(address, city, country, sep = ', '))
 
 # 5: Create dummy variables for company and product category - company part is done, product category part was incomplete due to # 3

 rawdata$company_philips <- ifelse(rawdata$company=="philips" & rawdata$number=5, 1, 0)
 rawdata$company_philips <- ifelse(rawdata$company=="philips" & rawdata$number=34, 1, 0)
 rawdata$company_philips <- ifelse(rawdata$company=="philips" & rawdata$number=5, 1, 0)

 # 6: Submit the project on Github
 write.csv(rawdata, 'refine_clean.csv')
