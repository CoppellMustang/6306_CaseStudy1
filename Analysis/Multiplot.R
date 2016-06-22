
## ---- my-label ----
plotbaseDF   <- data.frame(TempMerge[,c("GDPmillionsUSD","Economy","Income.Group","CountryCode","Region")])
DF_Low       <- plotbaseDF[plotbaseDF$Income.Group=="Low income",]
DF_LowMid    <- plotbaseDF[plotbaseDF$Income.Group=="Lower middle income",]
DF_UpMid     <- plotbaseDF[plotbaseDF$Income.Group=="Upper middle income",]
DF_HinonOECD <- plotbaseDF[plotbaseDF$Income.Group=="High income: nonOECD",]
DF_HiOECD    <- plotbaseDF[plotbaseDF$Income.Group=="High income: OECD",]

