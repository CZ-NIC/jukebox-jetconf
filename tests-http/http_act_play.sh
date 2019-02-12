#!/bin/bash

# This will get the root node of data tree

CLIENT_CERT="../jetconf-conf/example-client_curl.pem"

DATA="@jb_act_play_input.json"


echo "--- POST /restconf/data"
URL="https://127.0.0.1:8443/restconf/data/example-jukebox:jukebox/library/artist=Foo%20Fighters/album=Wasting%20Light/song=Rope/play"


curl --http2 -k --cert-type PEM -E ${CLIENT_CERT} -X POST -d "$DATA" "$URL"

