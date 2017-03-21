FROM fedora:latest

RUN dnf update -y

RUN dnf install -y \
        git \
        httpd \
        php \
        php-gd \
        php-json \
        php-mbstring \
        php-ZendFramework-Db-Adapter-Mysqli.noarch \
        php-zip

WORKDIR /opt

COPY apache.conf /etc/httpd/conf.d/lychee.conf

RUN git clone https://github.com/dmelo/Lychee.git && \
        chown -R apache.apache ./Lychee && \
		rm /etc/httpd/conf.d/autoindex.conf /etc/httpd/conf.d/welcome.conf

ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
