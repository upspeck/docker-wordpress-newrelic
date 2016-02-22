FROM wordpress:4.4.2-apache

ENV LICENSE_KEY
ENV MY_APPLICATION

RUN  wget -O - https://download.newrelic.com/548C16BF.gpg | sudo apt-key add - \
    && sh -c 'echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list' \
    && apt-get update \
    && apt-get install newrelic-php5 -y \
    && newrelic-install install -y \
    && sed -i "s/<%= license_key %>/$LICENSE_KEY/" newrelic/newrelic.yml \
    && RUN  sed -i "s/My Application/$MY_APPLICATION/" newrelic/newrelic.yml
