#!/bin/sh
set -e

if [ -z "$GITHUB_TOKEN" ]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

cd "$GITHUB_WORKSPACE"

set +e
echo "ENV vars"
env

echo "All vars"
set

echo "PWD"
pwd
find .
OUTPUT=$(pycodestyle .)
SUCCESS=$?
echo "$OUTPUT"
set -e

if [ -z "$PRECOMMAND_MESSAGE" ]; then
    echo "No precommand message"
else
    echo "There is a precommand message"
    OUTPUT="${PRECOMMAND_MESSAGE}\n\n${OUTPUT}"
fi

# If there were errors as part of linting, post a comment. Else, do nothing.
if [ $SUCCESS -ne 0 ]; then
  echo "Making a comment"
  PAYLOAD=$(echo '{}' | jq --arg body "$OUTPUT" '.body = $body')
  COMMENTS_URL=$(jq -r .pull_request.comments_url < /github/workflow/event.json)
  echo "$PAYLOAD"
  echo "$COMMENTS_URL"
  curl -s -S -H "Authorization: token $GITHUB_TOKEN" --header "Content-Type: application/json" --data "$PAYLOAD" "$COMMENTS_URL" > /dev/null
else
  echo "There were no pycodestyle issues"
fi
exit $SUCCESS

