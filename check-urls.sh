#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    exit 1;
fi

URL="$1"

echo "Checking $URL .."
status_code=$(curl --max-time 10 --location 10 --silent --insecure --head "$URL" | grep HTTP/ | tail -1 |  awk {'print $2'});
if [[ $status_code -ne 200 ]]; then
    echo $URL >> invalid_urls.txt
    echo -e "\x1B[31mError: $status_code \x1B[0m"
    exit 2
fi

echo -e "\x1B[32mOK \x1B[0m"
exit 0
