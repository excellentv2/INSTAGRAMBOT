from instabot import Bot
import time

# Логин и пароль вашего аккаунта
username = "bot.pytest"
password = "test1324@"

bot = Bot()
bot.login(username=username, password=password)

def send_message(user_id, message):
    bot.send_message(message, [user_id])

def send_message_to_followers(user_id, message):
    followers = bot.get_user_followers(user_id)
    for follower_id in followers:
        send_message(follower_id, message)
        time.sleep(10) 

def sort_followings_by_username(user_id):
    followings = bot.get_user_following(user_id)
    sorted_followings = sorted(followings, key=lambda x: x['username'].lower())
    return sorted_followings

# ID пользователя, которого мы будем подписывать и кому отправим сообщение
target_user_id = "48433501364"
target_message = "Привет, это тестовое сообщение для вас!"

# ID пользователя, чьи подписчики мы будем подписывать и кому отправим сообщение
target_followers_user_id = "48433501364"
target_followers_message = "Привет, это тестовое сообщение для ваших подписчиков!"

bot.follow(target_user_id)
send_message(target_user_id, target_message)

send_message_to_followers(target_followers_user_id, target_followers_message)

sorted_followings = sort_followings_by_username(target_user_id)

print("Отсортированные подписки:")
for user in sorted_followings:
    print(user['username'])

bot.logout()
