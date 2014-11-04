# Dockerfile

FROM silvenga/assp-base
MAINTAINER Mark Lopez (Silvenga) <m@silvenga.com>

# Init
ADD build/assp /etc/init.d/
RUN chmod +x /etc/init.d/assp
ADD build/start.sh /

# Settings
ADD build/my.cnf /etc/mysql/
ADD build/debian.cnf /etc/mysql/

# Entry
CMD /bin/bash /start.sh 
