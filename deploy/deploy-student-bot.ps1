# Windows PowerShell Script

# Edit and run the deploy-env.ps1 file first.

$env:BIND_ADDRESS=0.0.0.0
$env:ENVIRONMENT=development
$env:SERVICE_NAME='$STUDENT_ID'_bot
$env:SERVICE_ENV=development
$env:EXPRESS_USER='$STUDENT_ID'_bot
$env:EXPRESS_PASSWORD='$STUDENT_ID'_pw
$env:PORT=8080
$env:HUBOT_ADAPTER=slack
$env:HUBOT_ALIAS='$STUDENT_ID'
$env:HUBOT_NAME='$STUDENT_ID'_bot
$env:HUBOT_LOG_LEVEL=debug
$env:REDIS_URL=redis://127.0.0.1:6379
$env:HUBOT_SLACK_TOKEN='$SLACK_TOKEN'

docker build -t $HUB_USER/mybot:latest .
docker push $HUB_USER/mybot:latest
docker rm -f '$STUDENT_ID'_bot
docker run -e BIND_ADDRESS=$BIND_ADDRESS -e ENVIRONMENT=$ENVIRONMENT -e SERVICE_NAME=$SERVICE_NAME -e SERVICE_ENV=$SERVICE_ENV -e EXPRESS_USER=$EXPRESS_USER -e EXPRESS_PASSWORD=$EXPRESS_PASSWORD -e PORT=$PORT -e HUBOT_ADAPTER=$HUBOT_ADAPTER -e HUBOT_ALIAS=$HUBOT_ALIAS -e HUBOT_NAME=$HUBOT_NAME -e HUBOT_LOG_LEVEL=$HUBOT_LOG_LEVEL -e REDIS_URL=$REDIS_URL -e HUBOT_SLACK_TOKEN=$HUBOT_SLACK_TOKEN -d --restart="always" --name '$STUDENT_ID'_bot $HUB_USER/mybot:latest
