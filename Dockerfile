FROM wordpress:4.4.2-apache

ENV LICENSE_KEY temp
ENV MY_APPLICATION temp

RUN apt-get update \
    && apt-get install wget -y \
    && wget -O - https://download.newrelic.com/548C16BF.gpg | apt-key add - \
    && sh -c 'echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list' \
    && apt-get update \
    && apt-get install newrelic-php5 -y \ 
    && newrelic-install install -y \
    && sed -i "s/<%= license_key %>/$LICENSE_KEY/" /usr/local/etc/php/conf.d/newrelic.ini \
    && sed -i "s/My Application/$MY_APPLICATION/" /usr/local/etc/php/conf.d/newrelic.ini \
