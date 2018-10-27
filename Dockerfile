#docker build --rm -t airsonic/demo .
#docker run -i --rm -p 8080:8080 -v /mnt/DATA/music:/var/music airsonic/demo
FROM openjdk:8-jdk-alpine

LABEL description="Airsonic" \
      url="https://airsonic.github.io/"

# Prepare environment
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

# Install airsonic
ENV AIRSONIC_HOME /var/airsonic
RUN mkdir ${AIRSONIC_HOME} && \
  mkdir /var/music
WORKDIR ${AIRSONIC_HOME}
RUN wget https://github.com/airsonic/airsonic/releases/download/v10.1.1/airsonic.war
COPY airsonic.sh airsonic.sh

#
RUN chgrp -R root /var/airsonic; chmod -R 770 /var/airsonic && \
  chgrp -R root /var/music; chmod -R 770 /var/music

EXPOSE 8080

CMD ${AIRSONIC_HOME}/airsonic.sh