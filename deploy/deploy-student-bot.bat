# Windows Batch File

# Set the 3 variables below as instructed in class
# or edit and run the deploy-env.bat file
#
# You must edit this file and set the
# STUDENT_ID, SLACK_TOKEN, & HUB_USER variables correctly.
#set STUDENT_ID="000"
#set SLACK_TOKEN="000"
#set HUB_USER="000"


set BIND_ADDRESS="0.0.0.0"
set ENVIRONMENT="development"
set SERVICE_NAME="%STUDENT_ID%_bot"
set SERVICE_ENV="development"
set EXPRESS_USER="%STUDENT_ID%_bot"
set EXPRESS_PASSWORD="%STUDENT_ID%_pw"
set PORT="8080"
set HUBOT_ADAPTER="slack"
set HUBOT_ALIAS="%STUDENT_ID%"
set HUBOT_NAME="%STUDENT_ID%_bot"
set HUBOT_LOG_LEVEL="debug"
set REDIS_URL="redis://127.0.0.1:6379"
set HUBOT_SLACK_TOKEN="%SLACK_TOKEN%"

docker build -t %HUB_USER%/mybot:latest .
docker push %HUB_USER%/mybot:latest
docker run -e BIND_ADDRESS=%BIND_ADDRESS% -e ENVIRONMENT=%ENVIRONMENT% -e SERVICE_NAME=%SERVICE_NAME% -e SERVICE_ENV=%SERVICE_ENV% -e EXPRESS_USER=%EXPRESS_USER% -e EXPRESS_PASSWORD=%EXPRESS_PASSWORD% -e PORT=%PORT% -e HUBOT_ADAPTER=%HUBOT_ADAPTER% -e HUBOT_ALIAS=%HUBOT_ALIAS% -e HUBOT_NAME=%HUBOT_NAME% -e HUBOT_LOG_LEVEL=%HUBOT_LOG_LEVEL% -e REDIS_URL=%REDIS_URL% -e HUBOT_SLACK_TOKEN=%HUBOT_SLACK_TOKEN% -d --restart="always" --name %STUDENT_ID%_bot %HUB_USER%/mybot:latest
