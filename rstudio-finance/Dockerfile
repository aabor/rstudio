# aabor/rstudio-finance
FROM aabor/rstudio
# finance, forcasting
RUN installGithub.r \
    # Tools for Transaction-Oriented Trading Systems Development
    braverock/blotter \
    # Specify, build, and back-test quantitative financial trading and portfolio strategies.
    braverock/quantstrat \
    && rm -rf /tmp/downloaded_packages/

RUN install2.r --error \ 
    # Various data sets (stocks, stock indices, constituent data, FX, zero-coupon bond yield curves, volatility,
    # commodities) for Quantitative Risk Management practice
    qrmdata \
    && rm -rf /tmp/downloaded_packages/

# QuantLib installation
RUN  apt-get update && apt-get install -y \
    # QuantLib Library aims to provide a comprehensive software framework for quantitative finance. The goal is to
    # provide a standard open source library for quantitative analysis, modeling, trading, and risk management of
    # financial assets  
    libquantlib0v5 \
    libquantlib0-dev \
    libboost-all-dev \
    quantlib-python \
    quantlib-examples \
    # GSL - GNU Scientific Library
    libgsl2 \
    libgsl0-dev 

RUN install2.r --error \ 
    # Accompanying package to the book Quantitative Risk Management: Concepts, Techniques and Tools by Alexander J.
    # McNeil, Rüdiger Frey, and Paul Embrechts
    QRM \
    # Functions to calculate: moments, Pearson's kurtosis, Geary's kurtosis and skewness; tests related to them
    # (Anscombe-Glynn, D'Agostino, Bonett-Seier)
    moments \
    #ARFIMA, in-mean, external regressors and various GARCH flavors, with methods for fit, forecast, simulation,
    #inference and plotting 
    rugarch \
    # Alternative Time Series Analysis: Augmented Dickey-Fuller Test, Kwiatkowski-Phillips-Schmidt-Shin Test, Phillips-Perron Test, Trend Test
    aTSA \
    # Tools for Quantitative Risk Management
    qrmtools \
    && rm -rf /tmp/downloaded_packages/

# RUN install2.r --error \ 
#     # R Interface to the 'QuantLib' Library
#     RQuantLib \
#     && rm -rf /tmp/downloaded_packages/

RUN install2.r --error \ 
    # Alpha Vantage has free historical financial information. All you need to do is get a free API key
    alphavantager \
    #  The factualR package is a thin wrapper around the Factual.com API, to make it even easier for people working with
    #  R to explore Factual.com data sets
    factualR \
    && rm -rf /tmp/downloaded_packages/

# highfrequency financial data analysis
RUN install2.r --error \ 
    # Toolkit for the analysis of highfrequency financial data
    highfrequency \
    # An R package to compute Fourier integrals
    fourierin \
    # Financial Jump Detection
    JumpTest \
    # Simulation, Estimation and Forecasting of Beta-Skew-t-EGARCH Models
    betategarch \
    # computationally efficient functions for Kalman filtering, smoothing, forecasting, and simulation of multivariate
    # exponential family state space models, with observations from Gaussian, Poisson, binomial, negative binomial, and
    # gamma distributions
    KFAS \
    # Kalman filter, which can deal with NAs. It is entirely written in C and relies fully on linear algebra  ubroutines
    # contained in BLAS and LAPACK
    FKF \
    && rm -rf /tmp/downloaded_packages/

# Monte Carlo    
RUN install2.r --error \ 
    # Markov Chain Monte Carlo (MCMC)
    MCMCpack \
    # Provides tools for computing Monte Carlo standard errors (MCSE) in Markov chain Monte Carlo (MCMC) settings. MCSE
    # computation for expectation and quantile estimators is supported as well as multivariate estimations. The package
    # also provides functions for computing effective sample size and for plotting Monte Carlo estimates versus sample
    # size.
    mcmcse \
    #Stochastic Gradient Markov Chain Monte Carlo. Provides functions that performs popular stochastic gradient Markov chain Monte Carlo (SGMCMC) methods on user specified models.
    sgmcmc \
    && rm -rf /tmp/downloaded_packages/

# Prerequisitives to Bayesian Inference
RUN  apt-get update && apt-get install -y \
    #  Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical models using Markov Chain
    #  Monte Carlo (MCMC) simulation
    jags

# Bayesian Inference
RUN install2.r --error \ 
    # Interface to the JAGS MCMC library
    rjags \
    # Bayesian Estimation Supersedes the t-Test
    BEST \
    # provides R functions for Bayesian inference for various models widely used in marketing and micro-econometrics. The models include linear regression models, multinomial logit, multinomial probit, multivariate probit, multivariate mixture of normals (including clustering), density estimation using finite mixtures of normals as well as Dirichlet Process priors, hierarchical linear models, hierarchical multinomial logit, hierarchical negative binomial regression models, and linear instrumental variable models.
    bayesm \
    # contains R functions to perform Bayesian inference for survival regression models with flexible error and random effects distributions.
    bayesSurv \
    # performs Bayesian inference on the (discrete) power spectrum of time series.
    bspec \
    # a package for time series regression using dynamic linear models using MCMC. 
    bsts \
    # provides tools for Bayesian analysis of extreme value models.
    evdbayes \
    # implements Bayesian multilevel models in R using Stan . A wide range of distributions and link functions are supported, allowing users to fit linear, robust linear, binomial, Pois- son, survival, response times, ordinal, quantile, zero-inflated, hurdle, and even non-linear models all in a multilevel context.
    brms \
    # provides functions to perform Bayesian inference using a spectral analysis of Gaussian process priors. Gaussian processes are represented with a Fourier series based on cosine basis functions. Currently the package includes parametric linear models, partial linear additive models with/without shape restrictions, generalized linear additive models with/without shape restrictions, and density estimation model.
    bsamGP \
    && rm -rf /tmp/downloaded_packages/

# Diffusion processes
RUN install2.r --error \ 
    # Tools for performing inference and analysis on a class of quadratic diffusion processes for both scalar and
    # bivariate diffusion systems. For scalar diffusions, a module is provided for solving first passage time problems
    # for both time-homogeneous and time-inhomogeneous GQDs
    DiffusionRgqd \
    # Tools for performing inference and analysis on a class of quadratic jump diffusion processes.
    DiffusionRjgqd \
    # Bayesian Prediction of Stochastic Processes. Bayesian estimation and prediction for stochastic processes based on
    # the Euler approximation. Considered processes are: jump diffusion, (mixed) diffusion models, hidden (mixed)
    # diffusion models, non-homogeneous Poisson processes (NHPP), (mixed) regression models for comparison and a
    # regression model including a NHPP
    BaPreStoPro \
    && rm -rf /tmp/downloaded_packages/

