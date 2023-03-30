#Q1

#Reading data from csv file to dataframe
Ireland_crime <- read.csv("IrelandCrime.csv", na = "")

#Displaying structure and first 10 rows of dataset
str(Ireland_crime[1:10,])


#Recode missing data with NA
Missing_data <- Ireland_crime[!complete.cases(Ireland_crime),]
Missing_data

#Q2
#Selecting crime statistics from 2015 to 2019 to new dataframe
attach(Ireland_crime)
Ireland_crime_2015_2019 <- subset(Ireland_crime, 
                                  select = c("borough",
                                             "GARDA.DIVISION",
                                             "CODE",
                                             "OFFENCE",
                                             "TYPE.OF.OFFENCE",
                                             "X2015Q1",
                                             "X2015Q2",
                                             "X2015Q3",
                                             "X2015Q4",
                                             "X2016Q1",
                                             "X2016Q2",
                                             "X2016Q3",
                                             "X2016Q4",
                                             "X2017Q1",
                                             "X2017Q2",
                                             "X2017Q3",
                                             "X2017Q4",
                                             "X2018Q1",
                                             "X2018Q2",
                                             "X2018Q3",
                                             "X2018Q4",
                                             "X2019Q1",
                                             "X2019Q2",
                                             "X2019Q3"))


str(Ireland_crime_2015_2019)
detach(Ireland_crime)

#Changing variable names
names(Ireland_crime_2015_2019)[1] <- "Region"
names(Ireland_crime_2015_2019)[2] <- "Division"
names(Ireland_crime_2015_2019)[3] <- "OffenceCode"
names(Ireland_crime_2015_2019)[4] <- "Offence"
names(Ireland_crime_2015_2019)[5] <- "OffenceType"
str(Ireland_crime_2015_2019)

#Assigning modified dataframe to original dataframe
Ireland_crime <- Ireland_crime_2015_2019
str(Ireland_crime)

#To check NA values in modified dataframe
Missing_data1 <- Ireland_crime_2015_2019[!complete.cases(Ireland_crime_2015_2019),]
Missing_data1

#Q3
#Changing descriptions

attach(Ireland_crime)
Ireland_crime$OffenceType[OffenceType == "ATTEMPTS/THREATS TO MURDER/ASSAULTS/ HARASSMENTS AND RELATED OFFENCES"] <- "Murder/assault/harassment"
Ireland_crime$OffenceType[OffenceType == "DANGEROUS OR NEGLIGENT ACTS"] <- "Dangerous acts"
Ireland_crime$OffenceType[OffenceType == "KIDNAPPING AND RELATED OFFENCES"] <- "Kidnapping"
Ireland_crime$OffenceType[OffenceType == "ROBBERY/EXTORTION AND HIJACKING OFFENCES"] <- "Robbery"
Ireland_crime$OffenceType[OffenceType == "THEFT AND RELATED OFFENCES"] <- "Theft"
Ireland_crime$OffenceType[OffenceType == "FRAUD/DECEPTION AND RELATED OFFENCES"] <- "Fraud"
Ireland_crime$OffenceType[OffenceType == "PUBLIC ORDER AND OTHER SOCIAL CODE OFFENCES"] <- "Public order"
Ireland_crime$OffenceType[OffenceType == "OFFENCES AGAINST GOVERNMENT/ JUSTICE PROCEDURES AND ORGANISATION OF CRIME"] <- "Offences against government"
detach(Ireland_crime)

Ireland_crime

#Displaying 140 rows for Murder/assault/harassment
nrow(Ireland_crime[Ireland_crime$OffenceType == "Murder/assault/harassment",])

#Displaying 112 rows for Offences against government
nrow(Ireland_crime[Ireland_crime$OffenceType == "Offences against government",])



# Q5
#Using VIM package for missing data
install.packages("VIM")
library(VIM)
missing_values <- aggr(Ireland_crime, prop = FALSE, numbers = TRUE)

#Q8
dublin_crime <- subset(Ireland_crime, 
                                  select = c("Region",
                                             "Division",
                                             "OffenceCode",
                                             "Offence",
                                             "OffenceType",
                                             "X2015Q1",
                                             "X2015Q2",
                                             "X2015Q3",
                                             "X2015Q4",
                                             "X2016Q1",
                                             "X2016Q2",
                                             "X2016Q3",
                                             "X2016Q4",
                                             "X2017Q1",
                                             "X2017Q2",
                                             "X2017Q3",
                                             "X2017Q4",
                                             "X2018Q1",
                                             "X2018Q2",
                                             "X2018Q3",
                                             "X2018Q4",
                                             "X2019Q1",
                                             "X2019Q2",
                                             "X2019Q3"))




