#!/usr/bin/env python3

# Request health check

import sys
import requests

url = 'https://example-service.f-secure.com/health:443'

try:
    r = requests.get(url, timeout=5)
    # Succeed, print 0 and exit with status 0
    if r.status_code == 200:
        print('0')
        sys.exit(0)
    # Failed, print error code and exit with status 1
    else:
        print("Error code: ", r.status_code)
        sys.exit(1)
except requests.ConnectionError:
    # Failed, print error message and exit with status 2
    print("Can't reach ", url, "!")
    sys.exit(2)

