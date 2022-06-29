# URL Checker

A simple bash script to check if a URL is valid or not.

## How to install

You don't have to install anything, this is just a plain bash script. However you are able to get it using git clone:

```console
foo@bar:~$ git clone git@github.com:herczogzoltan/url-checker.git
```

## How to use

The script echoes the error message and the url checked into the standard output. Also when an error occurs, it saves the URL into a file called `invalid_urls.txt`.

### Check single URL

OK responses (HTTP status code 200-299):

```console
foo@bar:~$ ./check-urls.sh https://github.com
Checking https://github.com ..
OK status code: 200 for domain https://github.com
```

WARNING responses (HTTP status code 300-399):

```console
foo@bar:~$ ./check-urls.sh http://google.com
Checking http://google.com ..
Warning - Redirection - code: 301 for URL: http://google.com
```

Error responses:

```console
foo@bar:~$ ./check-urls.sh https://github.com/i-am-a-404
Checking https://github.com/i-am-a-404 ..
Severity: Error status code: 404 for URL: https://github.com/i-am-a-404
```

### Check multiple URLs from file source

```console
foo@bar:~$ cat filename | xargs -n 1 ./check-urls.sh
```

### Run in parallel mode using lines of files

```console
foo@bar:~$ cat filename | xargs -n 1 -P 4 ./check-urls.sh
```

Modify `-P` flag in the above example according to your needs and resources
