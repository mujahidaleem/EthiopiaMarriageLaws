/* Welcome to our code for our final ECO403 Project! The following document will
explain how we used data from the DHS program to formulate our regression and 
conclusions. */ 

/* Firstly, the dataset was obtained by the same resource as 
the original report. The link is: */
// https://dhsprogram.com/data/Guide-to-DHS-Statistics/index.htm#t=Age_at_First_Marriage.htm

/* The dataset itself was then downloaded in an excel format using STATCOMPILER. 
I aggregated the data into an excel document from the years 2000-2016.
This excel file is listed as "final dataset.xlsx". We will open it now: */ 

//NOTE make sure to define your directory where these files are located below!!

import excel "C:\Users\MDW614-CAF\Downloads\final_dataset.xlsx", sheet("2000_2016") firstrow

/*Now we should have imported variables in the right pane. We will rename, 
and add some variables for better communication*/

//Here we'll rename the variables that represent the proportions of people based
//on age (these will be used for the figures in our paper).

rename G fifteenToNineteen
rename H twentyToTwentyFour
rename I twentyFiveToTwentyNine
rename J thirtyToThirtyFour
rename K thirtyFiveToThirtyNine
rename L fortyToFortyFour
rename M fortyFiveToFortyNine
rename Value proportionOfRespondents

/*The goal of our paper is to do a difference and difference regression to map 
the long term effects of the marriage reform law introduced in 2000. To do this,
we look at the change in the age of first marriage of Ethiopian women and 
regress this against the change in proportion of Ethiopian women 
before and after the reform. In essence, as the proportion of Ethiopian women 
increase, we expect the age of first marriage to increase as well. 
In regards to the reform, if the reform increases the age of first marriage 
(which we find it does), then the age of first marriage should increase more
as the proportion of Ethiopian increase as opposed to before the reform.

In the original paper, the author used Post-Reform as the dummy that indicated 
if Ethiopian women were born before or after the reform, we do the same: */

gen Post_Reform = Reform 
//This is just the previously defined "Reform" var

/*
Recall we were looking at the most recent dataset in 2016, and the initial 
dataset released in 2000 before the reform was implemented. We will treat 
respondents in 2016 as the treatment group and respondents in 2000
as the control. This is suitable as the reform was implemented at the same time
as when the group was treated. The study conducted in 2000 contains information 
from before the reform (1900-1999), while the respondents in 2016 have felt the 
effects of the reform for 16 years. 
Apart from some missing information about the regional effects of the reform,
this is exactly how the author does it in the original paper.
*/

/*
Our treatment group will be the proportion of people when the reform variable
is active, while the control group will just be the proportion of people by 
itself. The first effects represent the age of first marriage if there was 
no reform, or if the number of women surveyed was 0. 
This is the minimum age in essence.
*/

/*
Now we'll create our difference in difference estimator to give us the effects
of the reform on the age of first of marriage.
*/

gen estimator = Post_Reform * proportionOfRespondents 

//Finally we have our regression!!!
reg AgeofFirstMarriage Post_Reform proportionOfRespondents estimator





