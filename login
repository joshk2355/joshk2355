import re
import json

def is_valid_username(username):
    return 6 <= len(username) <= 16

def is_valid_password(password):
    if 6 <= len(password) <= 20:
        if re.search('[a-z]', password) and re.search('[A-Z]', password):
            if re.search('[0-9]', password) and re.search('[!@#$%^&*()]', password):
                return True
    return False

def create_account():
    while True:
        username = input("Enter a username (6-16 characters): ")
        if not is_valid_username(username):
            print("Invalid username. It must be 6-16 characters long.")
            continue

        password = input("Enter a password (6-20 characters, with a capital letter, a lower case letter, a number and a special character): ")
        if not is_valid_password(password):
            print("Invalid password. It must be 6-20 characters long, with at least one capital letter, one lower case letter, one number and one special character.")
            continue

        # with open('e:/dck/passwd','w') as f:
        #     f.write(f'Username: {username} Password:{password}')

        print(f'username = {username}, password = {password}')
        password_file={username:password}
        with open('E:/dck/password.json', 'w') as f:
            json.dump(password_file,f)

        print("Account created successfully!")
        break

def get_valid_username(password):
    # this routine if the username is found in the password dictionary.
    # We give the user up to five tries to enter their userid.
    # if the user id is not found in 5 tries, the program exit.
    # ask for username
    tries_u = 0
    found_user = False
    while tries_u < 5 and found_user == False:
        username = input("Enter Username: ")
        if username in password:
            found_user = True
        else:
            tries_u += 1

    return found_user, username

def get_valid_password(password, username):
    # ths function is cheking to see if the password is correct for the username
    tries_p = 0
    password_found = False
    stored_password = password[username]
    while tries_p < 3 and password_found == False:
        user_password = input("Enter your password: ")
        if user_password in stored_password:
            password_found = True
        else:
            tries_p += 1
    if not password_found:
        print("Password was not found")
    return password_found
def validate_account():
    with open('e:/dck/password.json', 'r') as g:
        password = json.load(g)
    #print(f'password = {[password]}')

    found_user, username = get_valid_username(password)
    password_found = get_valid_password(password, username)



def start():
    on_start = int(input("Creat Account: 1 Login: 2 Quit: 3: "))
    if on_start == 1:
        create_account()
    if on_start == 2:
        validate_account()
        # get valid user login

    if on_start == 3:
        exit(0)
