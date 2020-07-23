# aabor/tensorflow
# configured for automatic build
FROM tensorflow/tensorflow:2.3.0rc2-gpu-jupyter

LABEL maintainer="A. A. Borochkin"

# installation utilities
RUN  apt-get update && apt-get install -y \
  wget zip unzip make cron nano vim tree \
  build-essential \
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

RUN apt-get update && apt-get install -y \
  gcc \
  binutils \
  cmake \
  && apt-get clean

RUN pip install jupyterthemes mysql-connector-python tensorflow_datasets
RUN pip install mpmath sympy
RUN pip install seaborn scikit-learn xlearn
RUN pip install pytest pytest-flask testpath mime dataset openpyxl
RUN pip install kaggle pause humanfriendly
RUN pip install pymongo Flask-Session flask-mongo-sessions
RUN pip install numba