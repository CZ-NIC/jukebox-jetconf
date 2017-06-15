#!/bin/bash

# This will get the root node of data tree

CLIENT_CERT="/home/pspirek/sslclient/pavel_curl.pem"

echo "--- GET /restconf/data"
URL="https://127.0.0.1:8443/restconf/data"
curl --http2 -k --cert-type PEM -E $CLIENT_CERT -X GET "$URL"

