import requests
import json

# pip install requests
# send HTTP requests
# requests.methodname(params)
# https://www.w3schools.com/python/module_requests.asp

print("\nGET CALL 1 -------------------------------------------------------------------------------------\n")

x = requests.get('https://w3schools.com/python/demopage.htm')
print(x.text)

print("\nGET CALL 2 -------------------------------------------------------------------------------------\n")

users_list = requests.get(
    "https://reqres.in/api/users?page=2",
    timeout=2.50
)
print(f"""
Response obj: {users_list.json()}
Status code: {users_list.status_code}
""")

# JSON obj to string
users_json_str = json.dumps(users_list.json(), indent=4)
print(users_json_str)

users_dict = json.loads(users_json_str)
"""
{
    "page": 2,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
        {
            "id": 7,
            "email": "michael.lawson@reqres.in",
            "first_name": "Michael",
            "last_name": "Lawson",
            "avatar": "https://reqres.in/img/faces/7-image.jpg"
        },
        {
            "id": 8,
            "email": "lindsay.ferguson@reqres.in",
            "first_name": "Lindsay",
            "last_name": "Ferguson",
            "avatar": "https://reqres.in/img/faces/8-image.jpg"
        },
        {
            "id": 9,
            "email": "tobias.funke@reqres.in",
            "first_name": "Tobias",
            "last_name": "Funke",
            "avatar": "https://reqres.in/img/faces/9-image.jpg"
        },
        {
            "id": 10,
            "email": "byron.fields@reqres.in",
            "first_name": "Byron",
            "last_name": "Fields",
            "avatar": "https://reqres.in/img/faces/10-image.jpg"
        },
        {
            "id": 11,
            "email": "george.edwards@reqres.in",
            "first_name": "George",
            "last_name": "Edwards",
            "avatar": "https://reqres.in/img/faces/11-image.jpg"
        },
        {
            "id": 12,
            "email": "rachel.howell@reqres.in",
            "first_name": "Rachel",
            "last_name": "Howell",
            "avatar": "https://reqres.in/img/faces/12-image.jpg"
        }
    ],
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
"""
print(users_dict["data"][0]["first_name"])  # Michael

print("\nPOST CALL -------------------------------------------------------------------------------------\n")

json_request = {"name": "morpheus", "job": "leader"}
create_user = requests.post(
    "https://reqres.in/api/users",
    json=json_request,
    timeout=2.50
)
print(json.dumps(create_user.json(), indent=4))
"""
{
    "name": "morpheus",
    "job": "leader",
    "id": "492",
    "createdAt": "2024-03-01T19:00:00.959Z"
}
"""

print("\nHEAD CALL -------------------------------------------------------------------------------------\n")

# print the response headers (the HTTP headers of the requested file):
# HEAD requests are done when you do not need the content of the file, but only the status_code or HTTP headers.

http_headers_response = requests.head('https://www.w3schools.com/python/demopage.php')
print(http_headers_response.headers)
"""
{'Accept-Ranges': 'bytes', 'Age': '589424', 'Cache-Control': 'public', 'Content-Security-Policy': "frame-ancestors 'self' https://mycourses.w3schools.com;", 'Content-Type': 'text/html; charset=UTF-8', 'Date': 'Fri, 01 Mar 2024 19:03:15 GMT', 'Last-Modified': 'Fri, 23 Feb 2024 23:19:31 GMT', 'Server': 'ECS (tir/CDD4)', 'X-Cache': 'HIT', 'X-Content-Security-Policy': "frame-ancestors 'self' https://mycourses.w3schools.com;", 'X-Powered-By': 'PHP/8.0.7, ASP.NET', 'Content-Length': '0'}
"""

print("\nDELETE CALL -------------------------------------------------------------------------------------\n")

delete_response = requests.delete('https://w3schools.com/python/demopage.php')
# print the response text (the content of the requested file):
print(delete_response.text)
