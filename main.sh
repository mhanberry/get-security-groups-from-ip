#!/bin/bash

set -e

if [[ $# != 2 ]]; then
	echo "usage: `basename $0` profile pattern"
	exit
fi

PROFILE="$1"

get_security_groups(){
	echo 'retrieving security groups...'
	aws --profile $PROFILE ec2 describe-security-groups --output json > security-groups.json
}

# Main

get_security_groups
node filter.js $2
