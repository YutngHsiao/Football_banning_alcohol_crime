##data imputation
library(mice)
tempData <- mice(alc,m=5,maxit=50,meth='pmm',seed=500)
##data normalization
library(clusterSim)
crime_nw_melt$v <- data.Normalization (crime_nw_melt$value,type="n4",normalization="column")
##change data structure
library(reshape)
crime_sub_melt <- melt(crime_sub, id=c("region"))



