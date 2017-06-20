#!/bin/bash

CLIENT_CERT="/home/pspirek/sslclient/pavel_curl.pem"

POST_DATA="@jb_op_play_input.json"
URL="https://127.0.0.1:8443/restconf/operations/example-jukebox:play"
curl --http2 -k --cert-type PEM -E $CLIENT_CERT -X POST -d "$POST_DATA" "$URL"

