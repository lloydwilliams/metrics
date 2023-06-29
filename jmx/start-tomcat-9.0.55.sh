#!/bin/bash
export CATALINA_HOME="/Users/lloyd.williams/u01/tomcat/apache-tomcat-9.0.55"  
export CATALINA_BASE="${CATALINA_HOME}"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-19.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"

export JAVA_AGENT_HOME="/Users/lloyd.williams/u01/datadog"

export DD_SERVICE="tomcat"
export DD_TAGS="owner:lloyd,team:finance"
export DD_ENV="dev"
export DD_VERSION="9.0.55"
export DD_PROFILING_ENABLED="true" 
export DD_TRACE_ENABLED="true" 
export DD_JMXFETCH_ENABLED="true" 
export DD_LOGS_INJECTION="true"
export DD_AGENT_HOST="localhost"

## JMX FETCH
export DD_JMXFETCH_ENABLED=true
export DD_JMXFETCH_TOMCAT_ENABLED=true

#export DD_JMXFETCH_CONFIG=/Users/lloyd.williams/u01/jmx/jmxterm/conf.yaml
export DD_JMXFETCH_CONFIG=/Users/lloyd.williams/u01/jmx/c3p0/conf3.yaml

export CATALINA_OPTS="-javaagent:${JAVA_AGENT_HOME}/dd-java-agent.jar  \
 -XX:FlightRecorderOptions=stackdepth=256 -Dcom.sun.management.jmxremote \
 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false \
 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.port=9012 \
 -Djava.rmi.server.hostname=localhost -Ddd.jmxfetch.config=/Users/lloyd.williams/u01/jmx/c3p0/conf3.yaml"

#export CATALINA_OPTS="-javaagent:${JAVA_AGENT_HOME}/dd-java-agent.jar -XX:FlightRecorderOptions=stackdepth=256"

echo 'JMXFETCH_TOMCAT='$DD_JMXFETCH_TOMCAT_ENABLED

echo 'Starting tomcat with options: ' + ${CATALINA_OPTS} 

$CATALINA_HOME/bin/startup.sh
