# aabor/rstudio-text
FROM aabor/rstudio

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
    librdf0-dev \
    && apt-get clean

# Adobe Acrobat pdf files
RUN install2.r --error \ 
    # Text Extraction, Rendering and Converting of PDF Documents. Utilities based on 'libpoppler' for extracting text,
    # fonts, attachments and metadata from a PDF file. Also supports high quality rendering of PDF documents info PNG,
    # JPEG, TIFF format, or into raw bitmap vectors
    pdftools \
    && rm -rf /tmp/downloaded_packages/

# machine learning
RUN install2.r --error \ 
     # #R string manipulation functions that account for the effects of ANSI text formatting control sequences fansi \
     # set of functions for extending dendrogram objects in R, letting you visualize and compare trees of hierarchical
     # clusterings
     dendextend \
     # stopword lists
     stopwords \
     && rm -rf /tmp/downloaded_packages/

# text mining
RUN install2.r --error \ 
    # reshape and restructure text data.
    textshape \
    # Text Mining
    tm \
    # Natural Language Processing
    wordcloud \
    # A Word Cloud Geom for 'ggplot2'
    ggwordcloud \
    # Porter's word stemming algorithm. 
    SnowballC \
    # helps split text into tokens, supporting shingled n-grams, skip n-grams, words, word stems, sentences, paragraphs,
    # characters, lines, and regular expressions. 
    tokenizers \
    # Fast and memory-friendly tools for text vectorization, topic modeling (LDA, LSA), word embeddings (GloVe),
    # similarities. This package provides a source-agnostic streaming API, which allows researchers to perform analysis
    # of collections of documents which are larger than available RAM. All core functions are parallelized to benefit
    # from multicore machines.
    text2vec \
    #an interface to the C code for Latent Dirichlet Allocation (LDA) models and Correlated Topics Models (CTM) by David
    #M. Blei and co-authors and the C++ code for fitting LDA models using Gibbs sampling by Xuan-Hieu Phan and
    #co-authors
    topicmodels\
    # wrapper for several topic models that take similarly-formatted input and give similarly-formatted output Has
    # additional functionality for analyzing and diagnostics for topic models.
    textmineR \
    && rm -rf /tmp/downloaded_packages/

# image processing
RUN apt-get update && apt-get install -y \
    # for tesseract (OCR - Optical character recognition)
     libtesseract-dev \ 
     libleptonica-dev \
     tesseract-ocr-eng \
     && apt-get clean
RUN install2.r --error \ 
    # OCR - Optical character recognition
    tesseract \
    && rm -rf /tmp/downloaded_packages/

# bibliography
RUN install2.r --error \ 
    # bibliography reference manager
    RefManageR \
    # allows downloading and processing public domain works in the Project Gutenberg collection. Includes metadata for
    # all Project Gutenberg works, so that they can be searched and retrieved.
    gutenbergr \
    && rm -rf /tmp/downloaded_packages/

#Java dependent libraries    
RUN install2.r --error \ 
    # transcript analysis, Text Mining/ Natural Language Processing: frequency counts of sentence types, words,
    # sentences, turns of talk, syllables and other assorted analysis tasks
    qdap \
    #approximate string matching version of R's native 'match' function
    stringdist \
    # an R interface to WordNet , a large lexical database of English. 
    wordnet \
    # An R interface to Weka (Version 3.9.2). Weka is a collection of machine learning algorithms for data mining tasks
    # written in Java, containing tools for data pre-processing, classification, regression, clustering, association
    # rules, and visualization 
    RWeka \
    # an R interface to KEA (Version 5.0). KEA (for Keyphrase Extraction Algorithm) allows for extracting keyphrases
    # from text documents. It can be either used for free indexing or for indexing with a controlled vocabulary.
    RKEA \
    && rm -rf /tmp/downloaded_packages/

# Additional graphics
RUN install2.r --error \ 
    # Plotly's R graphing library makes interactive, publication-quality graphs online. line plots, scatter plots, area
    #  charts, bar charts, error bars, box plots, histograms, heatmaps, subplots, multiple-axes, and 3D (WebGL based)
    #  charts
    plotly \
    # provides an interface between R and the Google. Charts API. Google Charts
    # offer interactive charts which can be embedded into web pages. The best known
    # of these charts is probably the Motion Chart
     googleVis \
    && rm -rf /tmp/downloaded_packages/

RUN installGithub.r \
   # Dashboard themes
   nik01010/dashboardthemes \
   && rm -rf /tmp/downloaded_packages/

RUN install2.r --error \ 
    # E-mail
    # send email using R
    sendmailR \
    && rm -rf /tmp/downloaded_packages/

# A Utility to Send Emails from R
# https://medium.com/@randerson112358/send-email-using-r-program-1b094208cf2f
# to fix error Sending the email to the following server failed : smtp.gmail.com:465
# accounts with 2-Step Verification enabled. Such accounts require an application-specific password for less secure apps acces
RUN R -e "devtools::install_github('rpremraj/mailR')"

# Graph visualisation
RUN install2.r --error \ 
    # Visualize the graphs and take advantage of any aesthetic properties assigned to nodes and edges
    DiagrammeR \
    # tidy interfaces to a lot of common graph algorithms
    tidygraph \
    #  ggraph is an extension of the ggplot2 API tailored to graph visualizations and provides the same flexible approach to building up plots layer by layer
    ggraph \
    # interactive visualization of networks
    visNetwork \
    && rm -rf /tmp/downloaded_packages/

# Python interface and Process Analysis libraries
RUN install2.r --error \ 
    reticulate \
    # Interface to 'PM4py' <http://pm4py.org>, a process mining library in 'Python'
    pm4py \
    && rm -rf /tmp/downloaded_packages/

# Networks and processes
RUN install2.r --error \ 
    # Comprehensive Business Process Analysis toolkit: event logs, 'Petri Net' objects, visualization of process maps
    bupaR \
    # Read and write XES Files to create event log objects used by the 'bupaR' framework.
    xesreadR \
    # Exploratory and descriptive analysis of event based data. Provides methods for describing and selecting process data, and for preparing event log data for process mining
    edeaR \
    # Event dataset repository including both real-life and artificial event logs    
    eventdataR \
    # Rule-Based Conformance Checking of Business Process Event Data
    processcheckR \
    # Building, Visualizing, Exporting and Replaying Petri Nets
    petrinetR \
    # Process discovery with variants of the Heuristics Miner algorithm
    heuristicsmineR \
    # Visualize of process maps based on event logs, in the form of directed graphs
    processmapR \
    # Provides animated process maps based on the 'procesmapR' package
    processanimateR \
    # Functions for constructing dashboards for business process monitoring
    processmonitR \
    && rm -rf /tmp/downloaded_packages/


# RUN installGithub.r \

#     && rm -rf /tmp/downloaded_packages/


#RUN installGithub.r \
#    && rm -rf /tmp/downloaded_packages/
