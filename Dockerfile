FROM ubuntu:latest

USER root

ENV DEBIAN_FRONTEND noninteractive   
RUN apt-get update\
    && apt-get upgrade -y\
    && apt-get install apache2 -y\
    && apt-get install wget -y\
    && apt-get install -y software-properties-common\
    && add-apt-repository ppa:ondrej/php\
    && apt update -y\
    && apt-get install -y php7.2 php7.2-dev php7.2-redis php7.2-mongo php7.2-gd php7.2-curl php7.2-mbstring php7.2-zip php7.2-json php7.2-bz2 php7.2-bcmath php7.2-ctype php7.2-dom php7.2-xml php7.2-simplexml php7.2-soap php7.2-xsl php7.2-cli php7.2-common php7.2-imagick php7.2-psr gcc autoconf make && apt-get install libapache2-mod-php7.2 -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
 

RUN wget  https://github.com/phalcon/cphalcon/archive/v4.1.1.tar.gz\
    && tar -xvzf v4.1.1.tar.gz

WORKDIR cphalcon-4.1.1/build/

RUN ./install



CMD service apache2 start
