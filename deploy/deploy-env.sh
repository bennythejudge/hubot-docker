#/bin/bash -xv


# Set the 3 variables below as instructed
export STUDENT_ID="000"
export SLACK_TOKEN="000"
export HUB_USER="000"

if [ ${STUDENT_ID} == "000" ] || [ ${SLACK_TOKEN} == "000" ] || [ ${HUB_USER} == "000" ]; then
  echo
  echo "You must edit this file and set the"
  echo "STUDENT_ID, SLACK_TOKEN, & HUB_USER variables correctly."
  echo
fi

