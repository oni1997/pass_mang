import json
from flask import Flask, request

app = Flask(__name__)

@app.route('/save-password', methods=['POST'])
def save_password():
    data = request.get_json()
    website = data['website']
    username = data['username']
    password = data['password']

    # Store the password in a JSON file
    passwords = {}
    try:
        with open('passwords.json', 'r') as file:
            passwords = json.load(file)
    except FileNotFoundError:
        pass

    passwords[website] = {'username': username, 'password': password}

    with open('passwords.json', 'w') as file:
        json.dump(passwords, file)

    return 'Password saved successfully'

if __name__ == '__main__':
    app.run()