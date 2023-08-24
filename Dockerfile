FROM tomcat:7
MAINTAINER piesecurity <admin@pie-secure.org>
ENV ADMIN_USER="mark"
ENV PG_VERSION 9.3.4
ENV ADMIN_PASSWORD="jigsawroxx"
RUN set -ex \
	&& rm -rf /usr/local/tomcat/webapps/* \
	&& chmod a+x /usr/local/tomcat/bin/*.sh
COPY target/pet-clinic.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8090
