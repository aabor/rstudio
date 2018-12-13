# rstudio
## Libraries added
RStudio in docker container with additional packages.

openssh enabled.

Different Fonts 'TrueType', 'OpenType', Type 1, web fonts, etc.

R packages for C++

Java 8 Oracle

rJava package

poppler

shiny server

Shiny packages

RSelenium

## Statistical packages
Functions for latent class analysis, short time Fourier transform, fuzzy clustering, support vector machines, shortest path computation, bagged clustering, naive Bayes classifier
e1071 

Gaussian Mixture Modelling for Model-Based Clustering, Classification, and Density Estimation
mclust

Companion to Applied Regression
car 

A range of axis labeling algorithms
labeling 

Forecasting Functions for Time Series and Linear Models
forecast 

Linear Mixed-Effects Models using 'Eigen' and S4
lme4 

Classification and Regression Training
caret 

Breiman and Cutler's Random Forests for Classification and Regression
randomForest 

Solve optimization problems using an R interface to NLopt. NLopt is a freegcopen-source library for nonlinear optimization.
nloptr 

A collection of dimensionality reduction techniques from R packages and a common interface for calling the methods
dimRed 

A collection of tests, data sets, and examples for diagnostic checking in linear regression models. 
lmtest 

core survival analysis routines, including definition of Surv objects, Kaplan-Meier and Aalen-Johansen (multi-state) curves, Cox models, and parametric accelerated failure time models.
survival 


Packages additional to ggplot

# docker-compose
Creates containers:

rstudio

rstudio-finance

rstudio-text

selenium

To start using Selenium:
```
library('RSelenium')
rd <- rsDriver(remoteServerAddr = 'selenium', port = 4444L, verbose = TRUE, browser = 'firefox')
# get browser
browser <- rd$client
# start testing
```
