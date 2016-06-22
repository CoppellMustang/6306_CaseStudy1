# 6306 CaseStudy
Manjula Kottegoda  
June 15, 2016  



## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
EduRaw <- read.csv("Analysis/Data/EDSTATS_Country.csv",blank.lines.skip=TRUE)
GDPRaw <- read.csv("Analysis/Data/GDP.csv",blank.lines.skip=TRUE)
View(EduRaw)
View(GDPRaw)
sum( !is.na(EduRaw))    # How to sum the NAs in a frame
```

```
## [1] 6550
```

```r
sum( !is.na(EduRaw$Short.Name))  # How to sum the NAs in a frame  
```

```
## [1] 234
```

```r
#Remove junk columns 
GDP <- subset(GDPRaw, select=-c(X.1,X.4))
  
#Remove empty rows 
GDP <-   GDP[!apply(GDP == "", 1, all),]

#Remove junk rows after a quick look
GDP <- GDP[5:235,]

#set headers
names(GDP) <- c("ISOcode","gdpRank","CountryName","$ in Millions")
GDP
```

```
##     ISOcode
## 7       JPN
## 8       DEU
## 9       FRA
## 10      GBR
## 11      BRA
## 12      RUS
## 13      ITA
## 14      IND
## 15      CAN
## 16      AUS
## 17      ESP
## 18      MEX
## 19      KOR
## 20      IDN
## 21      TUR
## 22      NLD
## 23      SAU
## 24      CHE
## 25      SWE
## 26      IRN
## 27      NOR
## 28      POL
## 29      BEL
## 30      ARG
## 31      AUT
## 32      ZAF
## 33      VEN
## 34      COL
## 35      THA
## 36      ARE
## 37      DNK
## 38      MYS
## 39      SGP
## 40      CHL
## 41      HKG
## 42      EGY
## 43      NGA
## 44      ISR
## 45      PHL
## 46      GRC
## 47      FIN
## 48      PAK
## 49      PRT
## 50      IRL
## 51      IRQ
## 52      DZA
## 53      PER
## 54      KAZ
## 55      CZE
## 56      ROM
## 57      UKR
## 58      QAT
## 59      NZL
## 60      KWT
## 61      VNM
## 62      HUN
## 63      BGD
## 64      AGO
## 65      PRI
## 66      MAR
## 67      SVK
## 68      ECU
## 69      SYR
## 70      OMN
## 71      CUB
## 72      AZE
## 73      BLR
## 74      LKA
## 75      HRV
## 76      DOM
## 77      SDN
## 78      LUX
## 79      UZB
## 80      BGR
## 81      GTM
## 82      URY
## 83      TUN
## 84      SVN
## 85      CRI
## 86      MAC
## 87      LBN
## 88      LTU
## 89      ETH
## 90      GHA
## 91      KEN
## 92      SRB
## 93      PAN
## 94      YEM
## 95      TKM
## 96      JOR
## 97      BHR
## 98      LVA
## 99      TZA
## 100     BOL
## 101     PRY
## 102     CMR
## 103     CIV
## 104     SLV
## 105     TTO
## 106     CYP
## 107     EST
## 108     ZMB
## 109     AFG
## 110     UGA
## 111     NPL
## 112     HND
## 113     GAB
## 114     GNQ
## 115     BIH
## 116     ZAR
## 117     BRN
## 118     GEO
## 119     PNG
## 120     JAM
## 121     BWA
## 122     MOZ
## 123     SEN
## 124     KHM
## 125     COG
## 126     ISL
## 127     NAM
## 128     TCD
## 129     ALB
## 130     NIC
## 131     MUS
## 132     BFA
## 133     MLI
## 134     MNG
## 135     SSD
## 136     MDG
## 137     ARM
## 138     ZWE
## 139     MKD
## 140     LAO
## 141     MLT
## 142     BHS
## 143     HTI
## 144     BEN
## 145     MDA
## 146     RWA
## 147     TJK
## 148     NER
## 149     KGZ
## 150     KSV
## 151     MCO
## 152     GIN
## 153     BMU
## 154     SUR
## 155     MNE
## 156     MWI
## 157     BRB
## 158     MRT
## 159     FJI
## 160     TGO
## 161     SLE
## 162     SWZ
## 163     ERI
## 164     GUY
## 165     ABW
## 166     BDI
## 167     LSO
## 168     MDV
## 169     CAF
## 170     CPV
## 171     BTN
## 172     LBR
## 173     BLZ
## 174     TMP
## 175     LCA
## 176     ATG
## 177     SYC
## 178     SLB
## 179     GMB
## 180     GNB
## 181     VUT
## 182     GRD
## 183     KNA
## 184     VCT
## 185     WSM
## 186     COM
## 187     DMA
## 188     TON
## 189     FSM
## 190     STP
## 191     PLW
## 192     MHL
## 193     KIR
## 194     TUV
## 196     ASM
## 197     ADO
## 198     CYM
## 199     CHI
## 200     CUW
## 201     DJI
## 202     FRO
## 203     PYF
## 204     GRL
## 205     GUM
## 206     IMY
## 207     PRK
## 208     LBY
## 209     LIE
## 210     MMR
## 211     NCL
## 212     MNP
## 213     SMR
## 214     SXM
## 215     SOM
## 216     MAF
## 217     TCA
## 218     VIR
## 219     WBG
## 221     WLD
## 223     LIC
## 224     MIC
## 225     LMC
## 226     UMC
## 227     LMY
## 228     EAP
## 229     ECA
## 230     LAC
## 231     MNA
## 232     SAS
## 233     SSA
## 234     HIC
## 235     EMU
## 237        
## 238        
## 239        
## 240        
## NA     <NA>
##                                                                                                                          gdpRank
## 7                                                                                                                              3
## 8                                                                                                                              4
## 9                                                                                                                              5
## 10                                                                                                                             6
## 11                                                                                                                             7
## 12                                                                                                                             8
## 13                                                                                                                             9
## 14                                                                                                                            10
## 15                                                                                                                            11
## 16                                                                                                                            12
## 17                                                                                                                            13
## 18                                                                                                                            14
## 19                                                                                                                            15
## 20                                                                                                                            16
## 21                                                                                                                            17
## 22                                                                                                                            18
## 23                                                                                                                            19
## 24                                                                                                                            20
## 25                                                                                                                            21
## 26                                                                                                                            22
## 27                                                                                                                            23
## 28                                                                                                                            24
## 29                                                                                                                            25
## 30                                                                                                                            26
## 31                                                                                                                            27
## 32                                                                                                                            28
## 33                                                                                                                            29
## 34                                                                                                                            30
## 35                                                                                                                            31
## 36                                                                                                                            32
## 37                                                                                                                            33
## 38                                                                                                                            34
## 39                                                                                                                            35
## 40                                                                                                                            36
## 41                                                                                                                            37
## 42                                                                                                                            38
## 43                                                                                                                            39
## 44                                                                                                                            40
## 45                                                                                                                            41
## 46                                                                                                                            42
## 47                                                                                                                            43
## 48                                                                                                                            44
## 49                                                                                                                            45
## 50                                                                                                                            46
## 51                                                                                                                            47
## 52                                                                                                                            48
## 53                                                                                                                            49
## 54                                                                                                                            50
## 55                                                                                                                            51
## 56                                                                                                                            52
## 57                                                                                                                            53
## 58                                                                                                                            54
## 59                                                                                                                            55
## 60                                                                                                                            56
## 61                                                                                                                            57
## 62                                                                                                                            58
## 63                                                                                                                            59
## 64                                                                                                                            60
## 65                                                                                                                            61
## 66                                                                                                                            62
## 67                                                                                                                            63
## 68                                                                                                                            64
## 69                                                                                                                            65
## 70                                                                                                                            66
## 71                                                                                                                            67
## 72                                                                                                                            68
## 73                                                                                                                            69
## 74                                                                                                                            70
## 75                                                                                                                            71
## 76                                                                                                                            72
## 77                                                                                                                            73
## 78                                                                                                                            74
## 79                                                                                                                            75
## 80                                                                                                                            76
## 81                                                                                                                            77
## 82                                                                                                                            78
## 83                                                                                                                            79
## 84                                                                                                                            80
## 85                                                                                                                            81
## 86                                                                                                                            82
## 87                                                                                                                            83
## 88                                                                                                                            84
## 89                                                                                                                            85
## 90                                                                                                                            86
## 91                                                                                                                            87
## 92                                                                                                                            88
## 93                                                                                                                            89
## 94                                                                                                                            90
## 95                                                                                                                            91
## 96                                                                                                                            92
## 97                                                                                                                            93
## 98                                                                                                                            94
## 99                                                                                                                            95
## 100                                                                                                                           96
## 101                                                                                                                           97
## 102                                                                                                                           98
## 103                                                                                                                           99
## 104                                                                                                                          100
## 105                                                                                                                          101
## 106                                                                                                                          102
## 107                                                                                                                          103
## 108                                                                                                                          104
## 109                                                                                                                          105
## 110                                                                                                                          106
## 111                                                                                                                          107
## 112                                                                                                                          108
## 113                                                                                                                          109
## 114                                                                                                                          110
## 115                                                                                                                          111
## 116                                                                                                                          112
## 117                                                                                                                          113
## 118                                                                                                                          114
## 119                                                                                                                          115
## 120                                                                                                                          116
## 121                                                                                                                          117
## 122                                                                                                                          118
## 123                                                                                                                          119
## 124                                                                                                                          120
## 125                                                                                                                          121
## 126                                                                                                                          122
## 127                                                                                                                          123
## 128                                                                                                                          124
## 129                                                                                                                          125
## 130                                                                                                                          126
## 131                                                                                                                          127
## 132                                                                                                                          128
## 133                                                                                                                          129
## 134                                                                                                                          130
## 135                                                                                                                          131
## 136                                                                                                                          132
## 137                                                                                                                          133
## 138                                                                                                                          134
## 139                                                                                                                          135
## 140                                                                                                                          136
## 141                                                                                                                          137
## 142                                                                                                                          138
## 143                                                                                                                          139
## 144                                                                                                                          140
## 145                                                                                                                          141
## 146                                                                                                                          142
## 147                                                                                                                          143
## 148                                                                                                                          144
## 149                                                                                                                          145
## 150                                                                                                                          146
## 151                                                                                                                          147
## 152                                                                                                                          148
## 153                                                                                                                          149
## 154                                                                                                                          150
## 155                                                                                                                          151
## 156                                                                                                                          152
## 157                                                                                                                          153
## 158                                                                                                                          154
## 159                                                                                                                          155
## 160                                                                                                                          156
## 161                                                                                                                          157
## 162                                                                                                                          158
## 163                                                                                                                          159
## 164                                                                                                                          160
## 165                                                                                                                          161
## 166                                                                                                                          162
## 167                                                                                                                          163
## 168                                                                                                                          164
## 169                                                                                                                          165
## 170                                                                                                                          166
## 171                                                                                                                          167
## 172                                                                                                                          168
## 173                                                                                                                          169
## 174                                                                                                                          170
## 175                                                                                                                          171
## 176                                                                                                                          172
## 177                                                                                                                          173
## 178                                                                                                                          174
## 179                                                                                                                          175
## 180                                                                                                                          176
## 181                                                                                                                          177
## 182                                                                                                                          178
## 183                                                                                                                          178
## 184                                                                                                                          180
## 185                                                                                                                          181
## 186                                                                                                                          182
## 187                                                                                                                          183
## 188                                                                                                                          184
## 189                                                                                                                          185
## 190                                                                                                                          186
## 191                                                                                                                          187
## 192                                                                                                                          188
## 193                                                                                                                          189
## 194                                                                                                                          190
## 196                                                                                                                             
## 197                                                                                                                             
## 198                                                                                                                             
## 199                                                                                                                             
## 200                                                                                                                             
## 201                                                                                                                             
## 202                                                                                                                             
## 203                                                                                                                             
## 204                                                                                                                             
## 205                                                                                                                             
## 206                                                                                                                             
## 207                                                                                                                             
## 208                                                                                                                             
## 209                                                                                                                             
## 210                                                                                                                             
## 211                                                                                                                             
## 212                                                                                                                             
## 213                                                                                                                             
## 214                                                                                                                             
## 215                                                                                                                             
## 216                                                                                                                             
## 217                                                                                                                             
## 218                                                                                                                             
## 219                                                                                                                             
## 221                                                                                                                             
## 223                                                                                                                             
## 224                                                                                                                             
## 225                                                                                                                             
## 226                                                                                                                             
## 227                                                                                                                             
## 228                                                                                                                             
## 229                                                                                                                             
## 230                                                                                                                             
## 231                                                                                                                             
## 232                                                                                                                             
## 233                                                                                                                             
## 234                                                                                                                             
## 235                                                                                                                             
## 237                                                                                                          .. Not available.  
## 238           Note: Rankings include only those economies with confirmed GDP estimates. Figures in italics are for 2011 or 2010.
## 239     a. Includes Former Spanish Sahara.  b. Excludes South Sudan  c. Covers mainland Tanzania only. d. Data are for the area 
## 240 controlled by the government of the Republic of Cyprus.   e. Excludes Abkhazia and South Ossetia.  f. Excludes Transnistria.
## NA                                                                                                                          <NA>
##                        CountryName $ in Millions
## 7                            Japan     5,959,718
## 8                          Germany     3,428,131
## 9                           France     2,612,878
## 10                  United Kingdom     2,471,784
## 11                          Brazil     2,252,664
## 12              Russian Federation     2,014,775
## 13                           Italy     2,014,670
## 14                           India     1,841,710
## 15                          Canada     1,821,424
## 16                       Australia     1,532,408
## 17                           Spain     1,322,965
## 18                          Mexico     1,178,126
## 19                     Korea, Rep.     1,129,598
## 20                       Indonesia       878,043
## 21                          Turkey       789,257
## 22                     Netherlands       770,555
## 23                    Saudi Arabia       711,050
## 24                     Switzerland       631,173
## 25                          Sweden       523,806
## 26              Iran, Islamic Rep.       514,060
## 27                          Norway       499,667
## 28                          Poland       489,795
## 29                         Belgium       483,262
## 30                       Argentina       475,502
## 31                         Austria       394,708
## 32                    South Africa       384,313
## 33                   Venezuela, RB       381,286
## 34                        Colombia       369,606
## 35                        Thailand       365,966
## 36            United Arab Emirates       348,595
## 37                         Denmark       314,887
## 38                        Malaysia       305,033
## 39                       Singapore       274,701
## 40                           Chile       269,869
## 41            Hong Kong SAR, China       263,259
## 42                Egypt, Arab Rep.       262,832
## 43                         Nigeria       262,597
## 44                          Israel       258,217
## 45                     Philippines       250,182
## 46                          Greece       249,099
## 47                         Finland       247,546
## 48                        Pakistan       225,143
## 49                        Portugal       212,274
## 50                         Ireland       210,771
## 51                            Iraq       210,280
## 52                         Algeria       205,789
## 53                            Peru       203,790
## 54                      Kazakhstan       203,521
## 55                  Czech Republic       196,446
## 56                         Romania       192,711
## 57                         Ukraine       176,309
## 58                           Qatar       171,476
## 59                     New Zealand       167,347
## 60                          Kuwait       160,913
## 61                         Vietnam       155,820
## 62                         Hungary       124,600
## 63                      Bangladesh       116,355
## 64                          Angola       114,147
## 65                     Puerto Rico       101,496
## 66                         Morocco        95,982
## 67                 Slovak Republic        91,149
## 68                         Ecuador        84,040
## 69            Syrian Arab Republic        73,672
## 70                            Oman        69,972
## 71                            Cuba        68,234
## 72                      Azerbaijan        66,605
## 73                         Belarus        63,267
## 74                       Sri Lanka        59,423
## 75                         Croatia        59,228
## 76              Dominican Republic        59,047
## 77                           Sudan        58,769
## 78                      Luxembourg        55,178
## 79                      Uzbekistan        51,113
## 80                        Bulgaria        50,972
## 81                       Guatemala        50,234
## 82                         Uruguay        49,920
## 83                         Tunisia        45,662
## 84                        Slovenia        45,279
## 85                      Costa Rica        45,104
## 86                Macao SAR, China        43,582
## 87                         Lebanon        42,945
## 88                       Lithuania        42,344
## 89                        Ethiopia        41,605
## 90                           Ghana        40,711
## 91                           Kenya        40,697
## 92                          Serbia        37,489
## 93                          Panama        36,253
## 94                     Yemen, Rep.        35,646
## 95                    Turkmenistan        35,164
## 96                          Jordan        31,015
## 97                         Bahrain        29,044
## 98                          Latvia        28,373
## 99                        Tanzania        28,242
## 100                        Bolivia        27,035
## 101                       Paraguay        25,502
## 102                       Cameroon        25,322
## 103                  Côte d'Ivoire        24,680
## 104                    El Salvador        23,864
## 105            Trinidad and Tobago        23,320
## 106                         Cyprus        22,767
## 107                        Estonia        22,390
## 108                         Zambia        20,678
## 109                    Afghanistan        20,497
## 110                         Uganda        19,881
## 111                          Nepal        18,963
## 112                       Honduras        18,434
## 113                          Gabon        18,377
## 114              Equatorial Guinea        17,697
## 115         Bosnia and Herzegovina        17,466
## 116               Congo, Dem. Rep.        17,204
## 117              Brunei Darussalam        16,954
## 118                        Georgia        15,747
## 119               Papua New Guinea        15,654
## 120                        Jamaica        14,755
## 121                       Botswana        14,504
## 122                     Mozambique        14,244
## 123                        Senegal        14,046
## 124                       Cambodia        14,038
## 125                    Congo, Rep.        13,678
## 126                        Iceland        13,579
## 127                        Namibia        13,072
## 128                           Chad        12,887
## 129                        Albania        12,648
## 130                      Nicaragua        10,507
## 131                      Mauritius        10,486
## 132                   Burkina Faso        10,441
## 133                           Mali        10,308
## 134                       Mongolia        10,271
## 135                    South Sudan        10,220
## 136                     Madagascar         9,975
## 137                        Armenia         9,951
## 138                       Zimbabwe         9,802
## 139                 Macedonia, FYR         9,613
## 140                        Lao PDR         9,418
## 141                          Malta         8,722
## 142                   Bahamas, The         8,149
## 143                          Haiti         7,843
## 144                          Benin         7,557
## 145                        Moldova         7,253
## 146                         Rwanda         7,103
## 147                     Tajikistan         6,972
## 148                          Niger         6,773
## 149                Kyrgyz Republic         6,475
## 150                         Kosovo         6,445
## 151                         Monaco         6,075
## 152                         Guinea         5,632
## 153                        Bermuda         5,474
## 154                       Suriname         5,012
## 155                     Montenegro         4,373
## 156                         Malawi         4,264
## 157                       Barbados         4,225
## 158                     Mauritania         4,199
## 159                           Fiji         3,908
## 160                           Togo         3,814
## 161                   Sierra Leone         3,796
## 162                      Swaziland         3,744
## 163                        Eritrea         3,092
## 164                         Guyana         2,851
## 165                          Aruba         2,584
## 166                        Burundi         2,472
## 167                        Lesotho         2,448
## 168                       Maldives         2,222
## 169       Central African Republic         2,184
## 170                     Cape Verde         1,827
## 171                         Bhutan         1,780
## 172                        Liberia         1,734
## 173                         Belize         1,493
## 174                    Timor-Leste         1,293
## 175                      St. Lucia         1,239
## 176            Antigua and Barbuda         1,134
## 177                     Seychelles         1,129
## 178                Solomon Islands         1,008
## 179                    Gambia, The           917
## 180                  Guinea-Bissau           822
## 181                        Vanuatu           787
## 182                        Grenada           767
## 183            St. Kitts and Nevis           767
## 184 St. Vincent and the Grenadines           713
## 185                          Samoa           684
## 186                        Comoros           596
## 187                       Dominica           480
## 188                          Tonga           472
## 189          Micronesia, Fed. Sts.           326
## 190          São Tomé and Principe           263
## 191                          Palau           228
## 192               Marshall Islands           182
## 193                       Kiribati           175
## 194                         Tuvalu            40
## 196                 American Samoa            ..
## 197                        Andorra            ..
## 198                 Cayman Islands            ..
## 199                Channel Islands            ..
## 200                        Curaçao            ..
## 201                       Djibouti              
## 202                 Faeroe Islands            ..
## 203               French Polynesia            ..
## 204                      Greenland            ..
## 205                           Guam            ..
## 206                    Isle of Man            ..
## 207               Korea, Dem. Rep.            ..
## 208                          Libya            ..
## 209                  Liechtenstein            ..
## 210                        Myanmar            ..
## 211                  New Caledonia            ..
## 212       Northern Mariana Islands            ..
## 213                     San Marino            ..
## 214      Sint Maarten (Dutch part)            ..
## 215                        Somalia            ..
## 216       St. Martin (French part)            ..
## 217       Turks and Caicos Islands            ..
## 218          Virgin Islands (U.S.)            ..
## 219             West Bank and Gaza            ..
## 221                          World    72,440,449
## 223                     Low income       504,431
## 224                  Middle income    22,249,909
## 225            Lower middle income     4,823,811
## 226            Upper middle income    17,426,690
## 227            Low & middle income    22,769,282
## 228            East Asia & Pacific    10,329,684
## 229          Europe & Central Asia     1,887,950
## 230      Latin America & Caribbean     5,344,028
## 231     Middle East & North Africa     1,540,807
## 232                     South Asia     2,286,093
## 233             Sub-Saharan Africa     1,289,813
## 234                    High income    49,717,634
## 235                      Euro area    12,192,344
## 237                                             
## 238                                             
## 239                                             
## 240                                             
## NA                            <NA>          <NA>
```

## Including Plots

You can also embed plots, for example:

![](6306_Casestudy_files/figure-html/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
