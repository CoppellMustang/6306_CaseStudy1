# ---- my-label ----
plotbaseDF   <- data.frame(TempMerge[,c("GDPmillionsUSD","Economy","Income.Group","CountryCode","Region")])
DF_Low       <- plotbaseDF[plotbaseDF$Income.Group=="Low income",]
DF_LowMid    <- plotbaseDF[plotbaseDF$Income.Group=="Lower middle income",]
DF_UpMid     <- plotbaseDF[plotbaseDF$Income.Group=="Upper middle income",]
DF_HinonOECD <- plotbaseDF[plotbaseDF$Income.Group=="High income: nonOECD",]
DF_HiOECD    <- plotbaseDF[plotbaseDF$Income.Group=="High income: OECD",]

# Generate 5 plots the same way just with different data frames from above
p1 <- ggplot(DF_Low, aes(x=Economy, y=GDPmillionsUSD)) + geom_point() + ggtitle("Spread for Low income group") + ylab("GDP in millions") + xlab("")  + theme(axis.text.x=element_text(angle=90, hjust=1,vjust=0.2),axis.text=element_text(size=8)) + scale_y_continuous(labels = scales::dollar)
p2 <- ggplot(DF_LowMid, aes(x=Economy, y=GDPmillionsUSD)) + geom_point() + ggtitle("Spread for Low middle income group") + ylab("GDP in millions") + xlab("")  + theme(axis.text.x=element_text(angle=90, hjust=1,vjust=0.2),axis.text=element_text(size=8)) + scale_y_continuous(labels = scales::dollar)
p3 <- ggplot(DF_UpMid, aes(x=Economy, y=GDPmillionsUSD)) + geom_point() + ggtitle("Spread for Upper middle income group") + ylab("GDP in millions") + xlab("")  + theme(axis.text.x=element_text(angle=90, hjust=1,vjust=0.2),axis.text=element_text(size=8)) + scale_y_continuous(labels = scales::dollar)
p4 <- ggplot(DF_HinonOECD, aes(x=Economy, y=GDPmillionsUSD)) + geom_point() + ggtitle("Spread for High income non OECD group") + ylab("GDP in millions") + xlab("")  + theme(axis.text.x=element_text(angle=90, hjust=1,vjust=0.2),axis.text=element_text(size=8)) + scale_y_continuous(labels = scales::dollar)
p5 <- ggplot(DF_HiOECD, aes(x=Economy, y=GDPmillionsUSD)) + geom_point() + ggtitle("Spread for High income OECD group") + ylab("GDP in millions") + xlab("")  + theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust=0.2),axis.text=element_text(size=8)) + scale_y_continuous(labels = scales::dollar)
