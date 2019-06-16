# aabor/rstudio
# configured for automatic build
FROM rocker/tidyverse:3.5.3

LABEL maintainer="A. Borochkin"

# installation utilities
RUN  apt-get update && apt-get install -y \
  wget zip unzip make cron nano vim \
  build-essential \
  && apt-get clean
# ssh 
RUN  apt-get update && apt-get install -y \
  openssh-server \
  xclip \
  && apt-get clean

# gnupg is needed to add new key 
RUN apt-get update && apt-get install -y \
  gnupg2 \
  && apt-get clean

# Prerequisitives to OpenGL
RUN  apt-get update && apt-get install -y \
    # functions implementing a new graphics device suitable for visualisation of GNU R objects in three dimensions using
    # the OpenGL libraries
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    freeglut3-dev

# System utilities
RUN install2.r --error \
  # A cross-platform interface to file system operations, built on top of the 'libuv' C library
  fs \
  #  Miscellaneous functions commonly used in other packages maintained by 'Yihui Xie'
  xfun \
  # General Network (HTTP/FTP/...) Client Interface for R
  RCurl \
  # 3D Visualization Using OpenGL
  rgl \
  doParallel \
  && rm -rf /tmp/downloaded_packages/

# Java 8
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ## for rJava
    default-jdk \
    ## used to build rJava and other packages
    libbz2-dev \
    libicu-dev \
    liblzma-dev \
    ## system dependency of hunspell (devtools)
    libhunspell-dev \
    ## system dependency of hadley/pkgdown
    libmagick++-dev \
    ## rdf, for redland / linked data
    librdf0-dev \
    ## for V8-based javascript wrappers
    libv8-dev \
    && apt-get clean
RUN install2.r --error \ 
    # Low-level interface to Java VM
    rJava \
    # conversion to and from data in Javascript object notation (JSON) format
    RJSONIO \
    && rm -rf /tmp/downloaded_packages/

# tidyverse packages for time series
RUN install2.r --error \
    # A Tool Kit for Working with Time Series in R
    timetk \
    # Bringing financial analysis to the 'tidyverse'. The 'tidyquant' package provides a convenient wrapper to various
    # 'xts', 'zoo', 'quantmod', 'TTR' and 'PerformanceAnalytics' package functions and returns the objects in the tidy
    # 'tibble' format. The main advantage is being able to use quantitative functions with the 'tidyverse' functions
    # including 'purrr', 'dplyr', 'tidyr', 'ggplot2', 'lubridate', etc.
    tidyquant \
    && rm -rf /tmp/downloaded_packages/

## install Fonts
RUN apt-get update && apt-get install -y libfreetype6-dev \
  libgtk2.0-dev \
  libxt-dev \
  libcairo2-dev \
  && apt-get clean

# 'TrueType', 'OpenType', Type 1, web fonts, etc.
# in R graphs
RUN install2.r --error \
  showtext \
  && rm -rf /tmp/downloaded_packages/

#Additional ggplot packages
RUN install2.r --error \
    # Based Publication Ready Plots
    ggpubr \
    # Provides text and label geoms for 'ggplot2' that help to avoid overlapping text labels. Labels repel away from
    # each other and away from the data points
    ggrepel \
    # Network Analysis and Visualization
    igraph \
    # Tools for Descriptive Statistics first descriptive tasks in data analysis,
    # consisting of calculating descriptive statistics, drawing graphical summaries and reporting the results
    # %overlaps% determines if two date ranges overlap
    DescTools \
    # parses and converts LaTeX math formulas to R’s plotmath expressions.
    latex2exp \
    && rm -rf /tmp/downloaded_packages/

# RESTful API
RUN install2.r --error \ 
    # An interface to the Gmail RESTful API. Allows access to your Gmail messages, threads, drafts and labels.
    gmailr \
    #Gives the ability to automatically generate and serve an HTTP API from R functions using the annotations in the R
    #documentation around your functions.
    plumber \
    # Pure R implementation of the ubiquitous log4j package. It offers hierarchic loggers, multiple handlers per logger,
    # level based filtering, space handling in messages and custom formatting.
    logging \
    && rm -rf /tmp/downloaded_packages/

# Dependencies for Rmpfr, gmp
RUN apt-get update && apt-get install -y \
    libgmp-dev \
    libmpfr-dev \
    && apt-get clean

RUN install2.r --error \ 
  # Multiple Precision Arithmetic (big integers and rationals, prime number tests, matrix computation), "arithmetic
  # without limitations" using the C library GMP (GNU Multiple Precision Arithmetic)
  gmp \
  # Public Key Infrastucture for R Based on the X.509 Standard. PKI functions such as verifying certificates, RSA
  # encription and signing which can be used to build PKI infrastructure and perform cryptographic tasks.
  PKI \
  # Multiple Precision Floating-Point Reliable
  Rmpfr \
  # PMCMRplus: Calculate Pairwise Multiple Comparisons of Mean Rank Sums Extended
  PMCMRplus \
  && rm -rf /tmp/downloaded_packages/


## Install R packages for C++
RUN install2.r --error \
  #Run 'R CMD check' from 'R' programmatically, and capture the results of the individual checks
  rcmdcheck \
  bindr \
  inline \
  rbenchmark \
  RcppArmadillo \
  RUnit \
  highlight \
  && rm -rf /tmp/downloaded_packages/

# For developers
RUN install2.r --error \
  # to install from github
  devtools \
  # R testing environment
  testthis \
  # Provides infrastructure to accurately measure and compare the execution time of R expressions
  microbenchmark \
  # Benchmark your CPU and compare against other CPUs. Also provides functions for obtaining system specifications, such
  # as RAM, CPU type, and R version.
  benchmarkme \
  && rm -rf /tmp/downloaded_packages/

# connection to Excel
RUN install2.r --error \ 
    # Simplifies the creation of Excel .xlsx files by providing a high level interface to writing, styling and editing
    # worksheets. Through the use of 'Rcpp', read/write times are comparable to the 'xlsx' and 'XLConnect' packages with
    # the added benefit of removing the dependency on Java.
    openxlsx \
    # Provides comprehensive functionality to read, write and format Excel data. Java dependent.
    XLConnect \
    && rm -rf /tmp/downloaded_packages/

# connection to Word
RUN install2.r --error \ 
    # Manipulation of Microsoft Word and PowerPoint Documents
    officer \
    # Create pretty tables for 'HTML', 'Microsoft Word' and 'Microsoft PowerPoint' documents. Functions are provided to let users create tables, modify and format their content. It extends package 'officer' that does not contain any feature for customized tabular reporting and can be used within R markdown documents
    flextable \
    # Serves for rendering MS Word documents with R inline code and inserting tables and plots.
    WordR \
    && rm -rf /tmp/downloaded_packages/

# RUN install2.r --error \ 
#     && rm -rf /tmp/downloaded_packages/

# Add shiny server
RUN export ADD=shiny && bash /etc/cont-init.d/add

##For shiny
RUN install2.r --error \ 
  # Deployment Interface for R Markdown Documents and Shiny Applications. 
  rsconnect \
  # Functions to improve user experience of shiny apps by Dean Attali
  shinyjs \
  # Create dashboards with 'Shiny'. A dashboard has three parts: a header, a sidebar, and a body. 
  shinydashboard \
  #alter the overall appearance of your Shiny application
  shinythemes \
  # A colour picker that can be used as an input in Shiny apps or Rmarkdown documents. The colour picker supports alpha
  # opacity, custom colour palettes, and many more options.
  colourpicker \
  # widgets to use in Shiny applications: Bootstrap switch, Material switch, Pretty Checkbox, Sweet Alert, Slider Text,
  # Knob Input, Select picker, Checkbox and radio buttons, Search bar, Dropdown button
  shinyWidgets \
  && rm -rf /tmp/downloaded_packages/

##For shiny, Java dependent libraries
RUN install2.r --error \ 
  # R interface to the JavaScript library DataTables. R data objects (matrices or data frames) can be displayed as
  # tables on HTML pages, and DataTables provides filtering, pagination, sorting, and many other features in the tables
  DT \
  # R interface to the dygraphs JavaScript charting library. It provides rich facilities for charting time-series data
  dygraphs \
  && rm -rf /tmp/downloaded_packages/


RUN install2.r --error \ 
    # easy and simple way to read, write and display bitmap images stored in the JPEG format
    png \
    # easy and simple way to read, write and display bitmap images stored in the PNG format
    jpeg \
    # Retrieve data from RSS/Atom feeds
    feedeR \
    && rm -rf /tmp/downloaded_packages/

RUN install2.r --error \ 
    #Functions for latent class analysis, short time Fourier transform, fuzzy clustering, support vector machines,
    #shortest path computation, bagged clustering, naive Bayes classifier
    e1071 \
    # Gaussian Mixture Modelling for Model-Based Clustering, Classification, and Density Estimation
    mclust \
    # Companion to Applied Regression
    car \
    # A range of axis labeling algorithms
    labeling \
    # Forecasting Functions for Time Series and Linear Models
    forecast \
    # Linear Mixed-Effects Models using 'Eigen' and S4
    lme4 \
    # Classification and Regression Training
    caret \
    # Breiman and Cutler's Random Forests for Classification and Regression
    randomForest \
    # Solve optimization problems using an R interface to NLopt. NLopt is a free/open-source library for nonlinear
    # optimization.
    nloptr \
    # A collection of dimensionality reduction techniques from R packages and a common interface for calling the methods
    dimRed \
    #  A collection of tests, data sets, and examples for diagnostic checking in linear regression models. 
    lmtest \
    # core survival analysis routines, including definition of Surv objects, Kaplan-Meier and Aalen-Johansen
    # (multi-state) curves, Cox models, and parametric accelerated failure time models.
    survival \
    && rm -rf /tmp/downloaded_packages/

# Tidyverse like packages
RUN install2.r --error \
  # Provides a general-purpose tool for dynamic report generation in R using Literate Programming techniques
  knitr \
  # Construct Complex Table with 'kable' and Pipe Syntax
  kableExtra \
  # Computes and displays complex tables of summary statistics. Output may be in LaTeX, HTML, plain text, or an R matrix for further processing
  tables \
  # Flexibly restructure and aggregate data using just two functions: melt and 'dcast'
  reshape2 \
  # Methods to Convert R Data to YAML and Back
  yaml \
  && rm -rf /tmp/downloaded_packages/

# Latex support
RUN  apt-get update && apt-get install -y \
  texlive-full \
  && apt-get clean

# Database support
RUN install2.r --error \ 
    # Legacy 'DBI' interface to 'MySQL' / 'MariaDB' based on old code ported from S-PLUS
    RMySQL \
    # A modern 'MySQL' client based on 'Rcpp'
    RMariaDB \
    # gWidgets API for Building Toolkit-Independent, Interactive GUIs
    gWidgets \
    # Provides a graphical user interface to connect with databases that use MySQL
    dbConnect \
    # defines a common interface between the R and database management systems (DBMS)
    DBI \
    && rm -rf /tmp/downloaded_packages/


