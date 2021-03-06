/**********************/
/*Clean and set memory*/
/**********************/
clear all
set matsize 5000
set more off

/******************/
/*Install programs*/
/******************/
cap ssc install xtabond2 
cap ssc install xtivreg2 
cap ssc install spmat 
cap ssc install spmack

/*********************/
/*Sets base directory*/
/*********************/
global project "/bbkinghome/pascual/winprofile/mydocs/replication_files_ddcg/"  /* Set base directory                         */
global limit=25                                                                             /* Evaluate effects 25 years after transition */
local repsBS=100                                                                           /* Number of bootstrap repetitions            */

/*******************************************************************************************************************************/
/*******************************************************************************************************************************/
/*********************DEFINE REQUIRED PROGRAMS THAT WILL BE USED DURING THE EXECUTION OF THIS DO FILE **************************/
/*******************************************************************************************************************************/
/*******************************************************************************************************************************/

capture program drop vareffects
program define vareffects, eclass

quietly: nlcom (effect1: _b[shortrun]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  , post

quietly: nlcom (effect2: _b[effect1]*_b[lag1]+_b[shortrun]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  , post

quietly: nlcom (effect3: _b[effect2]*_b[lag1]+_b[effect1]*_b[lag2]+_b[shortrun]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  , post
	  
quietly: nlcom (effect4: _b[effect3]*_b[lag1]+_b[effect2]*_b[lag2]+_b[effect1]*_b[lag3]+_b[shortrun]) ///
	  (effect3: _b[effect3]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  , post	  

forvalues j=5(1)$limit{	  
local j1=`j'-1
local j2=`j'-2
local j3=`j'-3
local j4=`j'-4

quietly: nlcom (effect`j': _b[effect`j1']*_b[lag1]+_b[effect`j2']*_b[lag2]+_b[effect`j3']*_b[lag3]+_b[effect`j4']*_b[lag4]+_b[shortrun]) ///
	  (effect`j1': _b[effect`j1']) ///
	  (effect`j2': _b[effect`j2']) ///
	  (effect`j3': _b[effect`j3']) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  , post	  	  

}

quietly: nlcom (effect$limit: _b[effect$limit]) ///
	  (longrun: _b[shortrun]/(1-_b[lag1]-_b[lag2]-_b[lag3]-_b[lag4])) ///
      (shortrun: _b[shortrun]) ///
	  (persistence: _b[lag1]+_b[lag2]+_b[lag3]+_b[lag4]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  , post
ereturn display
end


capture program drop vareffects8
program define vareffects8, eclass

quietly: nlcom (effect1: _b[shortrun]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post

quietly: nlcom (effect2: _b[effect1]*_b[lag1]+_b[shortrun]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post

quietly: nlcom (effect3: _b[effect2]*_b[lag1]+_b[effect1]*_b[lag2]+_b[shortrun]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post
	  
quietly: nlcom (effect4: _b[effect3]*_b[lag1]+_b[effect2]*_b[lag2]+_b[effect1]*_b[lag3]+_b[shortrun]) ///
	  (effect3: _b[effect3]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post
	  
quietly: nlcom (effect5: _b[effect4]*_b[lag1]+_b[effect3]*_b[lag2]+_b[effect2]*_b[lag3]+_b[effect1]*_b[lag4]+_b[shortrun]) ///
	  (effect4: _b[effect4]) ///
	  (effect3: _b[effect3]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post
	  
quietly: nlcom (effect6: _b[effect5]*_b[lag1]+_b[effect4]*_b[lag2]+_b[effect3]*_b[lag3]+_b[effect2]*_b[lag4]+_b[effect1]*_b[lag5]+_b[shortrun]) ///
	  (effect5: _b[effect5]) ///
	  (effect4: _b[effect4]) ///
	  (effect3: _b[effect3]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post	

quietly: nlcom (effect7: _b[effect6]*_b[lag1]+_b[effect5]*_b[lag2]+_b[effect4]*_b[lag3]+_b[effect3]*_b[lag4]+_b[effect2]*_b[lag5]+_b[effect1]*_b[lag6]+_b[shortrun]) ///
	  (effect6: _b[effect6]) ///
	  (effect5: _b[effect5]) ///
	  (effect4: _b[effect4]) ///
	  (effect3: _b[effect3]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post	

quietly: nlcom (effect8: _b[effect7]*_b[lag1]+_b[effect6]*_b[lag2]+_b[effect5]*_b[lag3]+_b[effect4]*_b[lag4]+_b[effect3]*_b[lag5]+_b[effect2]*_b[lag6]+_b[effect1]*_b[lag7]+_b[shortrun]) ///
	  (effect7: _b[effect7]) ///
	  (effect6: _b[effect6]) ///
	  (effect5: _b[effect5]) ///
	  (effect4: _b[effect4]) ///
	  (effect3: _b[effect3]) ///
	  (effect2: _b[effect2]) ///
	  (effect1: _b[effect1]) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post	
	  
	  
forvalues j=9(1)$limit{	  
local j1=`j'-1
local j2=`j'-2
local j3=`j'-3
local j4=`j'-4
local j5=`j'-5
local j6=`j'-6
local j7=`j'-7
local j8=`j'-8

quietly: nlcom (effect`j': _b[effect`j1']*_b[lag1]+_b[effect`j2']*_b[lag2]+_b[effect`j3']*_b[lag3]+_b[effect`j4']*_b[lag4]+_b[effect`j5']*_b[lag5]+_b[effect`j6']*_b[lag6]+_b[effect`j7']*_b[lag7]+_b[effect`j8']*_b[lag8]+_b[shortrun]) ///
	  (effect`j1': _b[effect`j1']) ///
	  (effect`j2': _b[effect`j2']) ///
	  (effect`j3': _b[effect`j3']) ///
	  (effect`j4': _b[effect`j4']) ///
	  (effect`j5': _b[effect`j5']) ///
	  (effect`j6': _b[effect`j6']) ///
	  (effect`j7': _b[effect`j7']) ///
	  (shortrun: _b[shortrun]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post	  	  

}

quietly: nlcom (effect$limit: _b[effect$limit]) ///
	  (longrun: _b[shortrun]/(1-_b[lag1]-_b[lag2]-_b[lag3]-_b[lag4]-_b[lag5]-_b[lag6]-_b[lag7]-_b[lag8])) ///
      (shortrun: _b[shortrun]) ///
	  (persistence: _b[lag1]+_b[lag2]+_b[lag3]+_b[lag4]+_b[lag5]+_b[lag6]+_b[lag7]+_b[lag8]) ///
	  (lag1: _b[lag1]) ///
	  (lag2: _b[lag2]) ///
	  (lag3: _b[lag3]) ///
	  (lag4: _b[lag4]) ///
	  (lag5: _b[lag5]) ///
	  (lag6: _b[lag6]) ///
	  (lag7: _b[lag7]) ///
	  (lag8: _b[lag8]) ///
	  , post
ereturn display
end


capture program drop helm
program define helm
*
* This program will do Helmert transformation for a list of variables
* NOTE:  must have variables named id, year   
* to use enter >> helm var1 var2...
* new variables will be names with h_ in front h_var1  and so on
*
qui while "`1'"~="" {
gsort id -year                /*sort years descending */
tempvar one sum n m w 
* capture drop h_`1'         /* IF the variable exist - it will remain and not generated again */
gen `one'=1 if `1'~=.             /*generate one if x is nonmissing */
qui by id: gen `sum'=sum(`1')-`1' /*running sum without current element */
qui by id: gen `n'=sum(`one')-1     /*number of obs included in the sum */
replace `n'=. if `n'<=0             /* n=0 for last observation and =-1 if
                                   last observation is missing*/
gen `m'=`sum'/`n'                 /* m is forward mean of variable x*/
gen `w'=sqrt(`n'/(`n'+1))         /* weight on mean difference */
capture gen h_`1'=`w'*(`1'-`m')             /* transformed variable */ 
sort id year
mac shift
}
end




capture program hhkBS, eclass
syntax anything[, ydeep(integer 1960) ystart(integer 1964) yfinal(integer 2009) truncate(integer 4) depvarlags(integer 4)]
	local 0 `anything' 
	gettoken yvar 0 : 0 /*dependent variable*/
	gettoken seqexg   0 : 0, match(par) /*Sequentially exogenous variables*/
	gettoken gmminst  0 : 0, match(par) /*gmm style instruments*/
	gettoken gmmtrunc 0 : 0, match(par) /*gmm style instruments, truncated*/
	gettoken excov 0 : 0, match(par) /*exogenous covariates: diff coefficient for each equation*/
		
/*declares panel structure and defines estimation sample*/
quietly: tsset, clear
quietly: tsset newcl year
sort newcl year
quietly: xtreg `yvar' `seqexg' `excov', fe
quietly: gen tsample=e(sample)

/**************************************************************************************
*********Helmert transformations and partialing out covariates************************/
quietly: gen id=newcl
sort newcl year
quietly: reg `yvar' `excov' if tsample==1
quietly: predict `yvar'_res if tsample==1, resid
quietly: helm `yvar'_res
rename h_`yvar'_res h_`yvar'
drop `yvar'_res

local num_seqexg=0
local seqexg_helm
foreach var of local seqexg{
sort newcl year
local num_seqexg=`num_seqexg'+1
quietly: gen seqexg`num_seqexg'=`var'
quietly: reg seqexg`num_seqexg' `excov' if tsample==1
quietly: predict seqexg`num_seqexg'_res if tsample==1, resid
quietly: helm seqexg`num_seqexg'_res
rename h_seqexg`num_seqexg'_res h_seqexg`num_seqexg'
local seqexg_helm `seqexg_helm' h_seqexg`num_seqexg'
drop seqexg`num_seqexg' seqexg`num_seqexg'_res
}



/***************************************************************
***************Estimator  for year j between maxy and  start***/
***************************************************************/
sort newcl year

*initialize objects*
local obs=0
quietly: gen samptemp=.
matrix def Num1=J(`num_seqexg', 1, 0)
matrix def Num2=J(`num_seqexg', `num_seqexg', 0) 
matrix def Den1=J(`num_seqexg', `num_seqexg', 0) 

forvalues maxyear=`ystart'(1)`yfinal'{

local maxinst=`maxyear'-`ydeep' /*deeper gmm lags until ydeep. Warning: many of these instruments may be zero if no data*/
local maxtrunc=min(`truncate',`maxinst')
local j=`maxyear'-1960+1

*ivreg to check for collinearities and obtain degree of overidentification*
cap ivreg2 h_`yvar' (`seqexg_helm'=l(1/`maxinst').(`gmmlist') l(1/`maxtrunc').(`gmmlist_trunc'))  if year==`maxyear',   noid  noconstant

if _rc==0{
/*Runs k-class estimator*/
local lambda=1+e(sargandf)/e(N)
cap ivreg2 h_`yvar' (`seqexg_helm'=l(1/`maxinst').(`gmmlist') l(1/`maxtrunc').(`gmmlist_trunc'))  if year==`maxyear',  k(`lambda') nocollin coviv  noid noconstant

if _rc==0{
quietly: replace samptemp=e(sample) if year==`maxyear'
local mobs=e(N)
local obs=`obs'+`mobs'

/*Construct locals with restrictions*/
local restriction
local mresults
forvalues m=1(1)`num_seqexg'{
local restriction `restriction' & _b[h_seqexg`m']!=0
local mresults `mresults' (seqexg`m': _b[h_seqexg`m'])
}

/*Extracts results and weights them by the adjusted variance*/
if _rc==0   `restriction'  {
quietly: nlcom `mresults', post
matrix b=e(b)
matrix V=e(V)
cap matrix Num1=Num1+`mobs'*inv(V)*b'
cap matrix Num2=Num2+`mobs'^2*inv(V)
cap matrix Den1=Den1+`mobs'*inv(V)
}
}
}
}

/******************Compiles results and post them******************/
matrix est2top=inv(Den1)*Num1
matrix var2top=inv(Den1)*Num2*inv(Den1)
matrix b=est2top'
matrix V=var2top
mat colnames b = `seqexg' 
mat colnames V = `seqexg' 
mat rownames V = `seqexg' 
/*Countries in sample*/
quietly: bysort newcl: egen newsamp=max(samptemp)
quietly: replace newsamp=0 if newsamp!=1
/*Post estimation results*/
ereturn post b V, obs(`obs') depname("Dep var") esample(newsamp)

drop tsample samptemp id  h_`yvar' `seqexg_helm'  `gmmlist' `gmmlist_trunc' 
end


/*******************************************************************************************************************************/
/*******************************************************************************************************************************/
/************************************ ESTIMATION PROCEDURES AND STORING RESULTS ************************************************/
/*******************************************************************************************************************************/
/*******************************************************************************************************************************/

use "$project/Data/Analytic/DDCGdata_final.dta"
file open myfile using "$project/Results/Reproduction/TableMain_lags.tex", write replace /*p-value for lags 5 to 8 not reported in the table*/
file write myfile "p-value lags 5 to 8"

/*******************************
Left panel: Within estimator
*******************************/

foreach region in AFR EAP{

quietly: xtreg y l.y dem yy* if region == "`region'", fe r cluster(wbcode2)
estimates store e1_`region'
nlcom (shortrun: _b[dem])  (lag1: _b[L.y])  (lag2: 0)  (lag3: 0)  (lag4: 0), post
vareffects
estimates store e1_add_`region'

quietly: xtreg y l(1/2).y dem yy* if region == "`region'", fe r cluster(wbcode2)
estimates store e2_`region'
nlcom (shortrun: _b[dem])  (lag1: _b[L.y])  (lag2: _b[L2.y])  (lag3: 0)  (lag4: 0), post
vareffects
estimates store e2_add_`region'

quietly: xtreg y l(1/4).y dem yy* if region == "`region'", fe r cluster(wbcode2)
estimates store e3_`region'
nlcom (shortrun: _b[dem])  (lag1: _b[L.y])  (lag2: _b[L2.y])  (lag3: _b[L3.y])  (lag4: _b[L4.y]), post
vareffects
estimates store e3_add_`region'

quietly: xtreg y l(1/8).y dem yy* if region == "`region'", fe r cluster(wbcode2)
estimates store e4_`region'
test l5.y l6.y l7.y l8.y
file write myfile "&&&& [" %7.3f (r(p)) "] "
nlcom (shortrun: _b[dem])  (lag1: _b[L.y])  (lag2: _b[L2.y])  (lag3: _b[L3.y])  (lag4: _b[L4.y]) (lag5: _b[L5.y]) (lag6: _b[L6.y]) (lag7: _b[L7.y]) (lag8: _b[L8.y]), post
vareffects8
estimates store e4_add_`region'


#delimit ;
estout e1_`region' e2_`region' e3_`region' e4_`region' using "$project/Results/Reproduction/TableMain_`region'.tex", style(tex) 
varlabels(L.y "log GDP first lag" L2.y "log GDP second lag" L3.y "log GDP third lag" L4.y "log GDP fourth lag"  dem "Democracy") 
cells(b(star fmt(%9.3f)) se(par)) 
stats(ar2p N N_g, fmt(%7.2f %7.0f  %7.0f) labels( "\input{Results/Reproduction/TableMain_`region'_lags} \input{Results/Reproduction/TableMain_`region'_Add}  AR2 test p-value" "Observations" "Countries in sample" ))  
keep(L.y L2.y L3.y L4.y dem) 
order(dem L.y L2.y L3.y L4.y)
stardrop(dem L.y L2.y L3.y L4.y)  
nolabel replace mlabels(none) collabels(none); 
#delimit cr

#delimit ;
estout e1_add_`region' e2_add_`region' e3_add_`region' e4_add_`region' using "$project/Results/Reproduction/TableMain_`region'_Add.tex", style(tex) 
varlabels(longrun "Long-run effect of democracy"  effect$limit "Effect of democracy after $limit years"  persistence "Persistence of GDP process") 
cells(b(star fmt(%9.3f)) se(par)) 
keep(longrun effect$limit persistence) 
order(longrun effect$limit persistence)
stardrop(longrun effect$limit persistence)  
nolabel replace mlabels(none) collabels(none); 
#delimit cr
}

file write myfile "\\"
file close myfile



