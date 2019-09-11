#!/bin/sh
# Rick Buitrago <rbuitragoc@gmail.com>
# 

ACTUATOR_INFO_URL=$1
# echo "ACTUATOR_INFO_URL set to $ACTUATOR_INFO_URL"

check_all() {
    # commands availability: curl, jq
    command -v curl >/dev/null && continue || { echo "curl command not found. Please install first."; exit 1; }
    command -v jq >/dev/null && continue || { echo "jq command not found. Please install first (https://stedolan.github.io/jq/)"; exit 1; }
    
    # checking server is up and has spring boot actuator working
    if [ "`curl -s -I -L $ACTUATOR_INFO_URL | head -n 1 | cut -d$' ' -f2`" != "200" ]; then 
        echo "Actuator at URL $ACTUATOR_INFO_URL is not currently available."; 
        exit 1; 
    fi
}

retrieve_git_details() {
    curl -s -X GET $ACTUATOR_INFO_URL | jq '.git.commit.message.short,.git.commit.id.full'
}
check_all
retrieve_git_details