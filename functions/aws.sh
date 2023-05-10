#!/usr/bin/env bash


# AWS SSO login
function aws-sso-login {
    if [ -z "$1" ]
    then
        echo "Please provide an SSO profile!"
    else
        aws sso login --profile $1
        export AWS_PROFILE=$1
    fi
}
