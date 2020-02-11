FROM gitpod/workspace-full:latest

# optional: use a custom apache config.
COPY apache/apache.conf /etc/apache2/apache2.conf

# optional: change document root folder. It's relative to your git working copy.
ENV APACHE_DOCROOT_IN_REPO="www"

USER root
RUN apt-get update 
RUN apt-get install php7.2 php7.2-fpm php7.2-mysql -y
RUN apt-get install mysql-server -y
RUN mkdir /var/run/mysqld \
 && chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade
 
# Install our own MySQL config
COPY mysql/mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY mysql/client.cnf /etc/mysql/mysql.conf.d/client.cnf

COPY mysql/mysql-bashrc-launch.sh /etc/mysql/mysql-bashrc-launch.sh

USER gitpod

RUN echo "/etc/mysql/mysql-bashrc-launch.sh" >> ~/.bashrc
