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

# RUN install2.r --error \ 
#     # Dashboard themes
#     dashboardthemes \
#     && rm -rf /tmp/downloaded_packages/


#RUN installGithub.r \
#    && rm -rf /tmp/downloaded_packages/
