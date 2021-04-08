library(RStata)

#set working directory of replication files
setwd("/Users/abdoulayecisse/Desktop/Revised-reproduction-package-for-Acemoglu-et-al.-2019/Codes/Reproduction")

#linking to the STATA program
options("RStata.StataPath" = "/Applications/Stata/StataSE.app/Contents/MacOS/stata-se")
options("RStata.StataVersion" = 16)

#Running the do file for Table 2 of the paper
stata('Table2_final.do')

#Running the do file for Table 3 of the paper
stata('Table3_final.do')

#Running the do file for Table 4 of the paper
stata('Table4_final.do')

#Running the do file for Table 5 of the paper
stata('Table5_final.do')

#Running the do file for Table 6 of the paper
stata('Table6_final.do')

#Running the do file for Table 7 of the paper
stata('Table7_final.do')

#Running the do file for Table 8 of the paper
stata('Table8_final.do')

#Running the do file for Figure 1 of the paper
stata('Figure1_final.do')

#Running the do file for Figure 2 of the paper
stata('FIgure2_final.do')

#Running the do file for Figure 3, 4 and 5 of the paper
stata('Figure3_4_5_final.do')

#Running the do file for Figure 6 of the paper
stata('Figure6_final.do')
