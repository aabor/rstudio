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

RUN install2.r --error \ 
    # Tools for Quantitative Risk Management
    qrmtools \
    #ARFIMA, in-mean, external regressors and various GARCH flavors, with methods for fit, forecast, simulation,
    #inference and plotting 
    rugarch \
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
    quantlib-examples
# RUN install2.r --error \ 
#     # R Interface to the 'QuantLib' Library
#     RQuantLib \
#     && rm -rf /tmp/downloaded_packages/

RUN install2.r --error \ 
    # Alpha Vantage has free historical financial information. All you need to do is get a free API key
    alphavantager \
    && rm -rf /tmp/downloaded_packages/

