FROM gitpod/workspace-full:latest

# optional: use a custom apache config.
COPY apache/apache.conf /etc/apache2/apache2.conf

# optional: change document root folder. It's relative to your git working copy.
ENV APACHE_DOCROOT_IN_REPO="www"

USER root
RUN apt-get update 
RUN apt-get install php7.2 php7.2-fpm php7.2-mysql -y
