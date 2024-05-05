from instabot import Bot
import sys

if len(sys.argv) < 4:
    print("Использование: python id.py <логин> <пароль> <имя_пользователя>")
    sys.exit()

username = sys.argv[1]
password = sys.argv[2]
target_username = sys.argv[3]

bot = Bot()
bot.login(username=username, password=password, proxy=None)

user_id = bot.get_user_id_from_username(target_username)
print("ID пользователя:", user_id)

bot.logout()

