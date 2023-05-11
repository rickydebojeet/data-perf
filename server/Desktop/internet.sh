#!/bin/bash

/usr/bin/curl -s --location-trusted -u 22d0371:224fd339dcb046c488173fdd55610977 "https://internet-sso.iitb.ac.in/login.php" | \
grep -q window.location.href && \
echo 'Logged in!' || \
echo 'Something is wrong or already logged in!'
