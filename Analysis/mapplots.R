# ---- my-label ----
plotbaseDF   <- data.frame(TempMerge[,c("GDPmillionsUSD","Economy","Income.Group","CountryCode","Region")])
#-- Clean up older ISO codes
#ZAR is now COD, TMP is now TLS   ,ROM is now ROU
plotbaseDF[plotbaseDF=="ZAR"]<-"COD"
plotbaseDF[plotbaseDF=="TMP"]<-"TLS"
plotbaseDF[plotbaseDF=="ROM"]<-"ROU"
DF_Low       <- plotbaseDF[plotbaseDF$Income.Group=="Low income",]
DF_LowMid    <- plotbaseDF[plotbaseDF$Income.Group=="Lower middle income",]
DF_UpMid     <- plotbaseDF[plotbaseDF$Income.Group=="Upper middle income",]
DF_HinonOECD <- plotbaseDF[plotbaseDF$Income.Group=="High income: nonOECD",]
DF_HiOECD    <- plotbaseDF[plotbaseDF$Income.Group=="High income: OECD",]

#data(DF_Low)
sPDF1 <- joinCountryData2Map( DF_Low, joinCode = "ISO3", nameJoinColumn = "CountryCode",verbose = FALSE)
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapCountryData( sPDF1, mapTitle = "Low income countries", nameColumnToPlot="GDPmillionsUSD",colourPalette = "Heat",addLegend = FALSE,missingCountryCol = NA, lwd=1)


#data(DF_LowMid)
sPDF2 <- joinCountryData2Map( DF_LowMid, joinCode = "ISO3", nameJoinColumn = "CountryCode",verbose = FALSE)
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapCountryData( sPDF2, mapTitle = "Lower middle income countries", nameColumnToPlot="GDPmillionsUSD",colourPalette = "Heat",addLegend = FALSE,missingCountryCol = NA, lwd=1)


#data(DF_UpMid)
sPDF3 <- joinCountryData2Map( DF_UpMid, joinCode = "ISO3", nameJoinColumn = "CountryCode",verbose = TRUE)
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapCountryData( sPDF3, mapTitle = "Upper middle income countries", nameColumnToPlot="GDPmillionsUSD",colourPalette = "Heat",addLegend = FALSE,missingCountryCol = NA, lwd=1)


##data(DF_HinonOECD)
sPDF4 <- joinCountryData2Map( DF_HinonOECD, joinCode = "ISO3", nameJoinColumn = "CountryCode",verbose = TRUE)
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapCountryData( sPDF4, mapTitle = "High income nonOECD countries", nameColumnToPlot="GDPmillionsUSD",colourPalette = "Heat",addLegend = FALSE,missingCountryCol = NA, lwd=1)


#data(DF_HiOECD)
sPDF5 <- joinCountryData2Map( DF_HiOECD, joinCode = "ISO3", nameJoinColumn = "CountryCode",verbose = TRUE)
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapCountryData( sPDF5, mapTitle = "High income OECD countries", nameColumnToPlot="GDPmillionsUSD",colourPalette = "Heat",addLegend = FALSE,missingCountryCol = NA, lwd=1)

