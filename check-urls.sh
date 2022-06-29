#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    exit 1;
fi

URL="$1"

echo "Checking $URL .."
status_code=$(curl --write-out '%{http_code}' --silent  --output /dev/null "$URL")

if [[ $status_code -ge 200 && $status_code -le 299 ]];then
    echo -e "\x1B[32mOK status code: $status_code for domain $URL  \x1B[0m"
    exit 0
fi

if [[ $status_code -ge 300 && $status_code -le 399 ]];then
    echo -e "\x1B[33mWarning - Redirection - code: $status_code for URL: $URL \x1B[0m"
    exit 1
fi

echo "Error status code: $status_code for URL: $URL" >> invalid_urls.txt
echo -e "\x1B[31mError status code: $status_code for URL: $URL \x1B[0m"
exit 2

