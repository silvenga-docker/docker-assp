# Dockerfile

FROM ubuntu:14.04
MAINTAINER Mark Lopez (Silvenga) <m@silvenga.com>

ENV DEBIAN_FRONTEND noninteractive

# Install deps
RUN apt-get update && apt-get install -y build-essential unzip wget libssl-dev libdb-dev curl software-properties-common 

# Install MySQL
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && add-apt-repository 'deb http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main' && apt-get update
RUN echo 'mariadb-server-10.0 mysql-server/root_password password root' | debconf-set-selections
RUN echo 'mariadb-server-10.0 mysql-server/root_password_again password root' | debconf-set-selections
RUN apt-get install -y mariadb-server libmariadbclient-dev

# Install Perl deps
RUN curl -L http://cpanmin.us | perl - --sudo App::cpanminus
RUN cpanm --force Mail::SPF Mail::SPF::Query NetAddr::IP
RUN cpanm LWP::Simple Compress::Zlib Error Mail::DKIM Mail::DKIM::Verifier Digest::MD5 Digest::SHA1 Sys::CpuAffinity 
RUN cpanm PerlIO::scalar threads threads::shared Thread::Queue Thread::State Schedule::Cron BerkeleyDB Crypt::CBC 
RUN cpanm Time::HiRes Crypt::OpenSSL::AES Email::MIME::Modifier Email::Send Email::Valid Unicode::LineBreak Unicode::GCString
RUN cpanm File::chmod File::Find::Rule File::Slurp File::Which File::ReadBackwards File::Type MIME::Charset MIME::Types
RUN cpanm LEOCHARRE::DEBUG Linux::usermod LEOCHARRE::CLI Crypt::RC4 Smart::Comments Devel::Peek Devel::Size Devel::InnerPackage
RUN cpanm Text::Glob Text::Unidecode Tie::RDBM Tie::DBI Regexp::Optimizer Number::Compare Mail::SRS Filesys::Df
RUN cpanm Time::CTime Time::DaysInMonth Time::JulianDay Time::ParseDate Time::Timezone Convert::Scalar Convert::TNEF 
RUN cpanm Net::CIDR::Lite Net::DNS Net::IP::Match::Regexp Net::LDAP Net::IP Net::SenderBase Net::Syslog Net::SMTP::SSL Net::SMTP
RUN cpanm Lingua::Identify Lingua::StopWords Lingua::Stem::Snowball Archive::Zip Archive::Tar Archive::Extract
RUN cpanm IO::Compress::Base IO::Compress::Gzip IO::Socket::SSL IO::Socket::INET6 Data::Dumper Socket6 Authen::SASL 
RUN cpanm IO::Compress::Bzip2 IO::Compress::RawDeflate IO::Compress::Zip IO::Compress::Deflate IO::Wrap 
RUN cpanm DBD::LDAP DBD::PgPP DBD::Sprite DBD::File DBD::Log DBD::mysql DBD::CSV DBD::Template Sys::MemInfo 

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
