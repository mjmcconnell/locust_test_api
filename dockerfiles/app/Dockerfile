FROM ubuntu:14.04
MAINTAINER Mark McConnell <mark@rehabstudio.com>

# keep upstart quiet
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# no tty
ENV DEBIAN_FRONTEND noninteractive

# get up to date
RUN apt-get update && apt-get upgrade -y

# global installs [applies to all envs!]
RUN apt-get install -y build-essential git vim
RUN apt-get install -y python python-dev python-setuptools python-pip

#########################
##### Python Libs #######
#########################

# lxml requirements
RUN apt-get install -y libxslt1-dev

# psql requirements
RUN apt-get build-dep -y python-psycopg2

# install all depsendecies from pypi
ADD assets/requirements.txt /opt/venv/requirements.txt
RUN pip install -r /opt/venv/requirements.txt

#########################
###### User setup #######
#########################

# Add volumes for pesistence between runs
VOLUME ['/home/ubuntu']

# create a non-root user we can use to run the application inside the container
RUN groupadd -r ubuntu -g 1000 && \
    useradd -u 1000 -rg ubuntu -md /home/ubuntu -s /bin/bash ubuntu

# ensure ubuntu owns volumes
RUN mkdir /.ipython
RUN chown -R ubuntu:ubuntu /.ipython
RUN chown -R ubuntu:ubuntu /home/ubuntu

# add sudo config to enable root access for ubuntu user
ADD assets/sudoers /etc/sudoers.d/ubuntu

# switch to the new user account so that all commands run as `ubuntu`
ENV HOME /home/ubuntu
USER ubuntu
