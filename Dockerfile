FROM continuumio/anaconda3

ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/coopy

RUN apt-get update && apt-get install -y --no-install-recommends \
  net-tools \
  sudo \
  bzip2 \
  curl \
  gcc \
  git \
  python3-dev \
  vim \
  && \
  apt-get clean && \
  pip install --upgrade pip && \
  pip install django-pure-pagination gunicorn && \
  conda update -n base conda && \
  conda update --all && \
  conda install -c conda-forge nodejs=10.13.0 && \
  conda clean --all -y && \
  conda install -c anaconda django && \
  conda install -c conda-forge django-environ && \
  conda install -c conda-forge dj-database-url && \
  conda install -c conda-forge django-heroku && \
  conda install -c conda-forge dj-static && \
  conda install -c conda-forge whitenoise
