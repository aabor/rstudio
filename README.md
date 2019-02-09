# rstudio docker image
## Libraries added

For precise and full description of installed packages, please, refer to corresponding [`Dockerfile`](https://github.com/aabor/rstudio/blob/master/rstudio/Dockerfile)

RStudio in docker container with additional packages.

openssh enabled.

Different Fonts 'TrueType', 'OpenType', Type 1, web fonts, etc.

R packages for C++

`poppler` # and corresponding R package for Text Extraction, Rendering and Converting of PDF Documents. Utilities based on `libpoppler` for extracting text, fonts, attachments and metadata from a PDF file. Also supports high quality rendering of PDF documents info PNG, JPEG, TIFF format, or into raw bitmap vectors

`pdftools`

`shiny server`

## Shiny packages

## Additional tidyverse companion packages for time series

A Tool Kit for Working with Time Series in R

`timetk`

Bringing financial analysis to the 'tidyverse'

`tidyquant`

## Statistical packages
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

Gmail RESTful API

`gmailr`

Generate and serve an HTTP API from R functions
 
`plumber`

`logging` # usufull for concurrent applications

# rstudio-finance docker image
This Docker image is based on [aabor/rstudio](https://github.com/aabor/rstudio) and adds R financial libraries for financial trading, forcasting, tools for descriptive statistics: quantmod, qrmtools, rugarch among others. For precise and full description of installed packages, please, refer to corresponding [`Dockerfile`](https://github.com/aabor/rstudio/blob/master/rstudio-finance/Dockerfile)

# rstudio-text docker image
This Docker image is based on [aabor/rstudio](https://github.com/aabor/rstudio) and adds R libraries for text processing: qdap, topicmodels, textmineR, tesseract, stringdist among others. For precise and full description of installed packages, please, refer to corresponding [`Dockerfile`](https://github.com/aabor/rstudio/blob/master/rstudio-text/Dockerfile)

# docker-compose
Creates containers:

`rstudio`

`rstudio-finance`

`rstudio-text`
