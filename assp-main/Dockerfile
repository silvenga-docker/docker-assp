# Dockerfile

FROM silvenga/assp-base:14.04
MAINTAINER Mark Lopez (Silvenga) <m@silvenga.com>

# Init
ADD build/assp /etc/init.d/
RUN chmod +x /etc/init.d/assp
ADD build/start.sh /

# Settings
ADD build/my.cnf /etc/mysql/
ADD build/debian.cnf /etc/mysql/

# Clean up
RUN apt-get clean && rm -rf /root/.cpan/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Entry
CMD /bin/bash /start.sh 
