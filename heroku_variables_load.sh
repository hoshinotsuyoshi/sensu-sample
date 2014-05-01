#!/bin/sh

HEROKU_API_KEY_BASE64_ENCODED=$(cat HEROKU_API_KEY_BASE64_ENCODED)
HEROKU_APP_NAME=$(cat HEROKU_APP_NAME)
eval $( curl -n -X GET https://api.heroku.com/apps/$HEROKU_APP_NAME/config-vars -H "Accept: application/vnd.heroku+json; version=3" -H "Authorization: $HEROKU_API_KEY_BASE64_ENCODED" | ./JSON.sh/JSON.sh -b -p | sed -e 's/"\|\[\|\]//g' -e 's/\t/=/g' )
