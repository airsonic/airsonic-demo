#!/bin/sh

LOG=${AIRSONIC_HOME}/airsonic_sh.log
AIRSONIC_MAX_MEMORY=256
AIRSONIC_PORT=8080

echo "Launch airsonic"
${JAVA_HOME}/bin/java -Xmx${AIRSONIC_MAX_MEMORY}m \
  -Dairsonic.home=${AIRSONIC_HOME} \
  -Dserver.port=${AIRSONIC_PORT} \
  -Djava.awt.headless=true \
  -jar airsonic.war > ${LOG} 2>&1 &

tail -f ${LOG}