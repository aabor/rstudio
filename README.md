# rstudio docker image

[`aabor/rstudio`](https://cloud.docker.com/u/aabor/repository/docker/aabor/rstudio) docker image is based on official [`rocker/tidyverse`](https://hub.docker.com/r/rocker/tidyverse/) image which contains RStudio and basic `tidyverse` packages. For precise and full description of installed packages in `aabor/rstudio` image, please, refer to corresponding [`Dockerfile`](https://github.com/aabor/rstudio/blob/master/rstudio/Dockerfile).

Build is automated by SCM polling


`openssh` enabled.

Different Fonts 'TrueType', 'OpenType', Type 1, web fonts, etc.

Java 8

openxlsx, XLConnect (Java dependent)

R packages for C++

## Additional tidyverse companion packages for time series

A Tool Kit for Working with Time Series in R

`timetk`

Bringing financial analysis to the 'tidyverse'

`tidyquant`

## Working with png and jpeg files

## Math and statistical packages

R Interface to the Yacas Computer Algebra System

`Ryacas`

Functions for latent class analysis, short time Fourier transform, fuzzy clustering, support vector machines, shortest path computation, bagged clustering, naive Bayes classifier

`e1071`


Gaussian Mixture Modelling for Model-Based Clustering, Classification, and Density Estimation

`mclust`


Companion to Applied Regression 

`car` 


A range of axis labeling algorithms

`labeling`


Forecasting Functions for Time Series and Linear Models

`forecast`


Linear Mixed-Effects Models using 'Eigen' and S4

`lme4` 


Classification and Regression Training

`caret` 


Breiman and Cutler's Random Forests for Classification and Regression

`randomForest` 


Solve optimization problems using an R interface to NLopt. NLopt is a freegcopen-source library for nonlinear optimization.

`nloptr` 


A collection of dimensionality reduction techniques from R packages and a common interface for calling the methods

`dimRed` 


A collection of tests, data sets, and examples for diagnostic checking in linear regression models. 

`lmtest` 


Core survival analysis routines, including definition of Surv objects, Kaplan-Meier and Aalen-Johansen (multi-state) curves, Cox models, and parametric accelerated failure time models.

`survival`


## Packages additional to ggplot

Based Publication Ready Plots

`ggpubr`
    
Provides text and label geoms for 'ggplot2' that help to avoid overlapping text labels. Labels repel away from each other and away from the data points

`ggrepel`

Network Analysis and Visualization

`igraph`


## RESTful API

Generate and serve an HTTP API from R functions
 
`plumber`

`logging` # usufull for concurrent applications

# rstudio-finance docker image
[`aabor/rstudio-finance`](https://cloud.docker.com/repository/docker/aabor/rstudio-finance) docker image is based on [aabor/rstudio](https://github.com/aabor/rstudio) and adds R financial libraries for financial trading, forcasting.

## popular financial time series packages and time series models

`quantmod`, `qrmtools`, `rugarch`. 

## highfrequency financial data analysis

Fourier integrals, Kalman filter, jump detection.

## Bayesian Inference for time series

`BEST`, `bayesm`, `bsts`, `evdbayes`, `bsamGP` ecc.

## Monte Carlo simulation

`MCMCpack`, `mcmcse`, `sgmcmc` ecc.

For precise and full description of installed packages in `aabor/rstudio-finance`, please, refer to corresponding [`Dockerfile`](https://github.com/aabor/rstudio/blob/master/rstudio-finance/Dockerfile)

# rstudio-text docker image
[`aabor/rstudio-text`](https://cloud.docker.com/repository/docker/aabor/rstudio-text) docker image is based on [aabor/rstudio](https://github.com/aabor/rstudio) and adds R libraries for text processing: `qdap`, `topicmodels`, `textmineR`, `tesseract`, `stringdist` among others. For precise and full description of installed packages in `aabor/rstudio-text`, please, refer to corresponding [`Dockerfile`](https://github.com/aabor/rstudio/blob/master/rstudio-text/Dockerfile).

`poppler` and corresponding R package `pdftools` for Text Extraction, Rendering and Converting of PDF Documents. Utilities based on `libpoppler` for extracting text, fonts, attachments and metadata from a PDF file. Also supports high quality rendering of PDF documents info PNG, JPEG, TIFF format, or into raw bitmap vectors



# docker-compose
Creates containers:

`rstudio`

`rstudio-finance`

`rstudio-text`

`nbdatascience`

# Webhooks

Build is triggered in Jenkins via Webhook

Generic Webhook Trigger > Trigger builds remotely (e.g., from scripts) > Authentication Token

Use the following URL to trigger build remotely: JENKINS_URL/job/rstudio/build?token=TOKEN_NAME or /buildWithParameters?token=TOKEN_NAME
Optionally append &cause=Cause+Text to provide text that will be included in the recorded build cause

