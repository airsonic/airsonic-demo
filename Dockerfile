#docker build --rm -t airsonic/demo:tomcat .
#docker run -i --rm airsonic/demo:tomcat


FROM kirillf/centos-tomcat

LABEL description="Airsonic demo." \
      url="https://airsonic.github.io/"

USER root

RUN mkdir /opt/tomcat/webapps/airsonic
WORKDIR /opt/tomcat/webapps/airsonic
RUN wget https://github.com/airsonic/airsonic/releases/download/v10.1.1/airsonic.war
RUN jar xvf airsonic.war; rm airsonic.war
RUN rm /opt/tomcat/conf/context.xml
COPY context.xml /opt/tomcat/conf
COPY demo-changelog.xml /opt/tomcat/webapps/airsonic/WEB-INF/classes/liquibase
RUN sed -i \
    's/<\/databaseChangeLog>/    <include file="demo-changelog.xml" relativeToChangelogFile="true"\/>\n<\/databaseChangeLog>/g' \
    /opt/tomcat/webapps/airsonic/WEB-INF/classes/liquibase/db-changelog.xml

WORKDIR /opt/tomcat/webapps/
RUN rm -rf ROOT  docs  examples  host-manager  manager

RUN mkdir /var/airsonic; mkdir /var/music
COPY airsonic.properties /var/airsonic/airsonic.properties
ADD music /var/music


RUN chown -R root:root /opt/tomcat; chmod -R 770 /opt/tomcat; chmod -R 770 /var/airsonic; chmod -R 770 /var/music
