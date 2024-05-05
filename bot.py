from instabot import Bot
import sys
import time

if len(sys.argv) < 3:
    print("Использование: python bot.py <логин> <пароль> <ID_пользователя> [сообщение]")
    sys.exit()

username = sys.argv[1]
password = sys.argv[2]
target_user_id = sys.argv[3]

bot = Bot()
bot.login(username=username, password=password)

def send_message(user_id, message):
    bot.send_message(message, [user_id])

def follow_and_message(user_id, message):
    bot.follow(user_id)
    send_message(user_id, message)
    time.sleep(10)

def follow_and_message(user_id, message):
    bot.follow(user_id)
    send_message(user_id, message)

def follow_followers_and_message(user_id, message):
    followers = bot.get_user_followers(user_id)
    for follower in followers:
        follow_and_message(follower, message)

def sort_followings_by_username(user_id):
    followings = bot.get_user_following(user_id)
    sorted_followings = sorted(followings, key=lambda x: x['username'].lower())
    return sorted_followings

if len(sys.argv) > 4:
    message = sys.argv[4]
    send_message(target_user_id, message)
    follow_and_message(target_user_id, message)
    follow_followers_and_message(target_user_id, message)
else:
    send_message(target_user_id, "Привет! Это тестовое сообщение от бота.")
    follow_and_message(target_user_id, "Привет! Это тестовое сообщение от бота.")
    follow_followers_and_message(target_user_id, "Привет! Это тестовое сообщение от бота.")

sorted_followings = sort_followings_by_username(target_user_id)
for following in sorted_followings:
    print(following['username'])

bot.logout()
