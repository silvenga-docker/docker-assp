# Dockerfile

FROM ubuntu:14.04
MAINTAINER Mark Lopez (Silvenga) <m@silvenga.com>

ENV DEBIAN_FRONTEND noninteractive

# Install deps
RUN apt-get update \
	&& apt-get install -y \
		build-essential \
		unzip \
		wget \
		libssl-dev \
		libdb-dev \
		curl \
		software-properties-common 

# Install MySQL
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db \
	&& add-apt-repository 'deb http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main' \
	&& apt-get update \
	&& echo 'mariadb-server-10.0 mysql-server/root_password password root' | debconf-set-selections \
	&& echo 'mariadb-server-10.0 mysql-server/root_password_again password root' | debconf-set-selections \
	&& apt-get install -y mariadb-server libmariadbclient-dev

# Install Perl deps
RUN curl -L http://cpanmin.us | perl - --sudo App::cpanminus \
	&& cpanm --force \
		Mail::SPF Mail::SPF::Query NetAddr::IP \
	&& cpanm \
		LWP::Simple Compress::Zlib Error Mail::DKIM Mail::DKIM::Verifier Digest::MD5 Digest::SHA1 Sys::CpuAffinity \
		PerlIO::scalar threads threads::shared Thread::Queue Thread::State Schedule::Cron BerkeleyDB Crypt::CBC \
		Time::HiRes Crypt::OpenSSL::AES Email::MIME::Modifier Email::Send Email::Valid Unicode::LineBreak Unicode::GCString \
		File::chmod File::Find::Rule File::Slurp File::Which File::ReadBackwards File::Type MIME::Charset MIME::Types \
		LEOCHARRE::DEBUG Linux::usermod LEOCHARRE::CLI Crypt::RC4 Smart::Comments Devel::Peek Devel::Size Devel::InnerPackage \
		Text::Glob Text::Unidecode Tie::RDBM Tie::DBI Regexp::Optimizer Number::Compare Mail::SRS Filesys::Df \
		Time::CTime Time::DaysInMonth Time::JulianDay Time::ParseDate Time::Timezone Convert::Scalar Convert::TNEF \
		Net::CIDR::Lite Net::DNS Net::IP::Match::Regexp Net::LDAP Net::IP Net::SenderBase Net::Syslog Net::SMTP::SSL Net::SMTP \
		Lingua::Identify Lingua::StopWords Lingua::Stem::Snowball Archive::Zip Archive::Tar Archive::Extract \
		IO::Compress::Base IO::Compress::Gzip IO::Socket::SSL IO::Socket::INET6 Data::Dumper Socket6 Authen::SASL \
		IO::Compress::Bzip2 IO::Compress::RawDeflate IO::Compress::Zip IO::Compress::Deflate IO::Wrap \
		DBD::LDAP DBD::PgPP DBD::Sprite DBD::File DBD::Log DBD::mysql DBD::CSV DBD::Template Sys::MemInfo 

# Clean up
RUN apt-get clean \
	&& rm -rf \
		/root/.cpan/* \
		/var/lib/apt/lists/* \
		/tmp/* \
		/var/tmp/* 