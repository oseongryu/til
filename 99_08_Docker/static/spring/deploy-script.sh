 -p $$|tail -1
history -a
PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
alias vi='vi -Z';TERM=xterm;WAX_ENV=true;export PROMPT_COMMAND;export WAX_ENV
history -c
history -r

!/bin/bash
DEFAULT_PORT=10100
PORT1=10100
PORT2=10200
WAIT_TIME=0

# check as-is port
ASIS_PORT=$(ps -ef | grep java | grep partnerWas | awk '{print $9}' | sed 's/-Dserver.port=//g')
ASIS_PID=$(ps -ef | grep java | grep partnerWas | awk '{print $2}')

# set to-be port
if [[ $ASIS_PORT = "" ]]; then
  TOBE_PORT=$DEFAULT_PORT
elif [[ $ASIS_PORT = $PORT1  ]]; then
  echo "current WAS port is ${ASIS_PORT}..."
  TOBE_PORT=$PORT2
else
  echo "current WAS port is ${ASIS_PORT}..."
  TOBE_PORT=$PORT1
fi

echo "WAS will run on ${TOBE_PORT}..."

# copy jar file
cp  -f /home/hy/deploy/hy-*.jar /app/wasapp/partner/partner-$TOBE_PORT.jar

# start to-be was
echo "Start application"

JAVA_OPTS=" ${JAVA_OPTS} -Dserver.port=$TOBE_PORT"
JAVA_OPTS=" ${JAVA_OPTS} -Dspring.profiles.active=dev"
JAVA_OPTS=" ${JAVA_OPTS} -Dobj_name=partnerWas"

nohup /app/java/jdk-8u212-ojdkbuild-linux-x64/bin/java $JAVA_OPTS -jar /app/wasapp/partner/partner-$TOBE_PORT.jar 1>/dev/null 2>&1 &

# to-be was running check
until [ $WAIT_TIME -ge 60 ]
do
  RES_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:$TOBE_PORT/swagger-ui.html")
  if [ "${RES_CODE}" = "200" ]; then
    echo "was is run (${TOBE_PORT})"
	break
  else
    echo "was is not run (${TOBE_PORT})"
  fi
  sleep 2
  WAIT_TIME=$(expr $WAIT_TIME  + 1)
done


# after to-be was running
if [ "${WAIT_TIME}" -ge 60 ]; then
  echo "was run time out"
  return 1
else
  echo "was run"
  #change nginx conf
  sudo rm -rf /etc/nginx/conf.d/*
  sudo cp -f /app/nginx-conf/partner-$TOBE_PORT.conf /etc/nginx/conf.d/
  sudo /usr/sbin/nginx -s reload

  # kill as-is was
  echo "Running PID: {$ASIS_PID}"

  if [[ $ASIS_PID = "" ]]; then
    echo "Application is not running"
  else
    echo "Application is running, kill process: $ASIS_PID"
	sleep 10
	kill -9 $ASIS_PID
	sleep 10
  fi

  echo "Complete..."
  echo "You can see application log (/logs/partner)"
fi
