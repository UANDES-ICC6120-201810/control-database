# For ARM architectures use
FROM arm32v7/ubuntu:latest

# For x86 architectures use
# FROM ubuntu:latest

# Install dependencies
# Important to keep the '-y' to say 'yes' to the prompt or will raise non-zero error.

RUN apt-get update \
    && apt-get install -y mysql-server
# Expose database for remote connections
COPY control-point-init.sql /root/control-point-init.sql
RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf \
# Create mysql directory
    && mkdir -p /var/run/mysqld \
    && chown mysql:mysql /var/run/mysqld \
# Create SQL script for new user and database
    && service mysql start \
    && mysql < /root/control-point-init.sql

EXPOSE 3306

CMD /usr/bin/mysqld_safe
