# aabor/rstudio
# configured for automatic build
FROM rocker/tidyverse:3.5.0

LABEL maintainer="A. Borochkin"

# installation utilities
RUN  apt-get update && apt-get install -y \
  wget zip unzip make \
  && apt-get clean
# ssh 
RUN  apt-get update && apt-get install -y \
  openssh-server \
  xclip \
  && apt-get clean

## gnupg is needed to add new key 
RUN apt-get update && apt-get install -y \
  gnupg2 \
  && apt-get clean

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
  && apt-get clean

## Install R packages for C++
RUN install2.r --error \
  inline \
  rbenchmark \
  RUnit \
  highlight \
  && apt-get clean
# For developers
RUN install2.r --error \
  # to install from github
  devtools \
  # R testing environment
  testthis \
  && apt-get clean

# Setup JAVA_HOME
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

# Install Oracle JDK (Java SE Development Kit) 8u192 with Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files for JDK/JRE 8
RUN JAVA_VERSION=8 && \
    JAVA_UPDATE=192 && \
    JAVA_BUILD=12 && \
    JAVA_PATH=750e1c8617c5452694857ad95c3ee230 && \
    JAVA_SHA256_SUM=6d34ae147fc5564c07b913b467de1411c795e290356538f22502f28b76a323c2 && \
    JCE_SHA256_SUM=f3020a3922efd6626c2fff45695d527f34a8020e938a49292561f18ad1320b59 && \ 
    apt-get update && \
    cd "/tmp" && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/${JAVA_PATH}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    echo "${JAVA_SHA256_SUM}" "jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" | sha256sum -c - && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jce/${JAVA_VERSION}/jce_policy-${JAVA_VERSION}.zip" && \
    echo "${JCE_SHA256_SUM}" "jce_policy-${JAVA_VERSION}.zip" | sha256sum -c - && \
    tar -xzf "jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    mkdir -p "/usr/lib/jvm" && \
    mv "/tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME" && \
    ln -s "$JAVA_HOME/bin/"* "/usr/bin/" && \
    unzip -jo -d "$JAVA_HOME/jre/lib/security" "jce_policy-${JAVA_VERSION}.zip" && \    
    rm -rf "$JAVA_HOME/"*src.zip \
           "$JAVA_HOME/lib/missioncontrol" \
           "$JAVA_HOME/lib/visualvm" \
           "$JAVA_HOME/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/plugin.jar" \
           "$JAVA_HOME/jre/lib/ext/jfxrt.jar" \
           "$JAVA_HOME/jre/bin/javaws" \
           "$JAVA_HOME/jre/lib/javaws.jar" \
           "$JAVA_HOME/jre/lib/desktop" \
           "$JAVA_HOME/jre/plugin" \
           "$JAVA_HOME/jre/lib/"deploy* \
           "$JAVA_HOME/jre/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/"*jfx* \
           "$JAVA_HOME/jre/lib/amd64/libdecora_sse.so" \
           "$JAVA_HOME/jre/lib/amd64/"libprism_*.so \
           "$JAVA_HOME/jre/lib/amd64/libfxplugins.so" \
           "$JAVA_HOME/jre/lib/amd64/libglass.so" \
           "$JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so" \
           "$JAVA_HOME/jre/lib/amd64/"libjavafx*.so \
           "$JAVA_HOME/jre/lib/amd64/"libjfx*.so \
           "$JAVA_HOME/jre/bin/jjs" \
           "$JAVA_HOME/jre/bin/keytool" \
           "$JAVA_HOME/jre/bin/orbd" \
           "$JAVA_HOME/jre/bin/pack200" \
           "$JAVA_HOME/jre/bin/policytool" \
           "$JAVA_HOME/jre/bin/rmid" \
           "$JAVA_HOME/jre/bin/rmiregistry" \
           "$JAVA_HOME/jre/bin/servertool" \
           "$JAVA_HOME/jre/bin/tnameserv" \
           "$JAVA_HOME/jre/bin/unpack200" \
           "$JAVA_HOME/jre/lib/ext/nashorn.jar" \
           "$JAVA_HOME/jre/lib/jfr.jar" \
           "$JAVA_HOME/jre/lib/jfr" \
           "$JAVA_HOME/jre/lib/oblique-fonts" \           
           "$JAVA_HOME/README.html" \
           "$JAVA_HOME/THIRDPARTYLICENSEREADME-JAVAFX.txt" \
           "$JAVA_HOME/THIRDPARTYLICENSEREADME.txt" \            
           "$JAVA_HOME/jre/README" \
           "$JAVA_HOME/jre/THIRDPARTYLICENSEREADME-JAVAFX.txt" \
           "$JAVA_HOME/jre/THIRDPARTYLICENSEREADME.txt" \
           "$JAVA_HOME/jre/Welcome.html" \
           "$JAVA_HOME/jre/lib/security/README.txt" && \           
    apt-get -y clean && \
    rm -rf "/tmp/"* \
           "/var/cache/apt" \
           "/usr/share/man" \
           "/usr/share/doc" \
           "/usr/share/doc-base" \
           "/usr/share/info/*" \
  && R CMD javareconf
## make sure Java can be found in rApache and other daemons not looking in R ldpaths 
RUN echo "/usr/lib/jvm/java-8-oracle/jre/lib/amd64/server/" > /etc/ld.so.conf.d/rJava.conf 
RUN /sbin/ldconfig

## Install rJava package 
# install rJava dependencies
RUN apt-get update && apt-get install -y \
    # for Java
    libicu-dev \ 
    libbz2-dev \
    liblzma-dev \
    libpcre3-dev 
# install rJava package
RUN install2.r --error rJava \ 
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# install poppler, some dependencies of other R packages
RUN apt-get update && apt-get install -y \
    ## poppler to install pdftools to work with .pdf files
    libpoppler-cpp-dev \
    ## system dependency of hunspell (devtools)
    libhunspell-dev \
    ## system dependency of hadley/pkgdown
    libmagick++-dev \
    ## (GSL math library dependencies)
    # for topicmodels on which depends textmineR
    gsl-bin \
    libgsl0-dev \
    librdf0-dev

# Add shiny server
RUN export ADD=shiny && bash /etc/cont-init.d/add

# connection to other applications: Excel, Acrobat, ...
RUN install2.r --error \ 
  # Text Extraction, Rendering and Converting of PDF Documents. Utilities based on 'libpoppler' for extracting text, fonts, attachments and metadata from a PDF file. Also supports high quality rendering of PDF documents info PNG, JPEG, TIFF format, or into raw bitmap vectors
  pdftools \
  # R connection to Excel, Java dependent
  XLConnect \
  && rm -rf /tmp/downloaded_packages/

# web scrapping
RUN install2.r --error \ 
  # Wrappers around the 'xml2' and 'httr' packages to make it easy to download, then manipulate, HTML and XML.
  rvest \
  # An interface to the Gmail RESTful API. Allows access to your Gmail messages, threads, drafts and labels.
  gmailr \
  && rm -rf /tmp/downloaded_packages/

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
  # A colour picker that can be used as an input in Shiny apps or Rmarkdown
  # documents. The colour picker supports alpha opacity, custom colour palettes, 
  # and many more options.
  colourpicker \
  # widgets to use in Shiny applications: Bootstrap switch, Material switch,
  # Pretty Checkbox, Sweet Alert, Slider Text, Knob Input, Select picker, Checkbox
  # and radio buttons, Search bar, Dropdown button
  shinyWidgets \
  && rm -rf /tmp/downloaded_packages/

# Graphics Java script libraries
RUN install2.r --error \ 
  #provides an interface between R and the Google. Charts API. Google Charts offer interactive charts which can be embedded into web pages. The best known of these charts is probably the Motion Chart
  googleVis \
  # An R interface to the 'dygraphs' JavaScript charting library. 
  # Charting time-series data in R, including highly configurable series, 
  # axis-display and interactive features like zoom/pan and series/point highlighting.
  dygraphs \ 
  # A Wrapper of the JavaScript Library 'DataTables'. 
  # Data objects in R can be rendered as HTML tables using the JavaScript library 'DataTables' 
  # (typically via R Markdown or Shiny).
  DT \
  # Plotly's R graphing library makes interactive, publication-quality graphs online. 
  # line plots, scatter plots, area charts, bar charts, error bars, box plots, histograms, heatmaps, subplots, multiple-axes, and 3D (WebGL based) charts
  plotly \
  && rm -rf /tmp/downloaded_packages/

RUN install2.r --error \ 
    # easy and simple way to read, write and display bitmap images stored in the JPEG format
    png \
    # easy and simple way to read, write and display bitmap images stored in the PNG format
    jpeg \
    # Retrieve data from RSS/Atom feeds
    feedeR \
    && rm -rf /tmp/downloaded_packages/

RUN sudo installGithub.r \
  # Shiny Dashboardthemes
  nik01010/dashboardthemes \
  # customizable dashboard template for Shiny based on shiny.semantic and Semantic UI. 
  Appsilon/semantic.dashboard \
  && rm -rf /tmp/downloaded_packages/

RUN sudo installGithub.r \
  johndharrison/binman \
  johndharrison/wdman \ 
  ropensci/RSelenium \
  && rm -rf /tmp/downloaded_packages/

# RUN install2.r --error \
#   RSelenium \
#   && rm -rf /tmp/downloaded_packages/

RUN install2.r --error \
  gmp \
  && rm -rf /tmp/downloaded_packages/
