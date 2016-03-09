docker build -t spkane/mybot:latest .
docker push spkane/mybot:latest
docker run \
    -e BIND_ADDRESS="${BIND_ADDRESS}" \
    -e ENVIRONMENT="${ENVIRONMENT}" \
    -e SERVICE_NAME="${SERVICE_NAME}" \
    -e SERVICE_ENV="${SERVICE_ENV}" \
    -e EXPRESS_USER="${EXPRESS_USER}" \
    -e EXPRESS_PASSWORD="${EXPRESS_PASSWORD}" \
    -e PORT="${PORT}" \
    -e HUBOT_ADAPTER="${HUBOT_ADAPTER}" \
    -e HUBOT_ALIAS="${HUBOT_ALIAS}" \
    -e HUBOT_NAME="${HUBOT_NAME}" \
    -e REDIS_URL="${REDIS_URL}" \
    -e HUBOT_SLACK_TOKEN="${HUBOT_SLACK_TOKEN}" \
    -d --restart="always" --name mybot spkane/mybot:latest

