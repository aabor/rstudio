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

# docker-compose
Creates containers:

rstudio

selenium

To start using Selenium:
```
library('RSelenium')
rd <- rsDriver(remoteServerAddr = 'selenium', port = 4444L, verbose = TRUE, browser = 'firefox')
# get browser
browser <- rd$client
# start testing
```


dropbox

How to activate dropbox https://valh.io/blog/Dockerize-Dropbox-on-Linux


