# (xxx) xxx-xxxx 或 xxx-xxx-xxxx
# ^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$ (xxx) xxx-xxxx
# ^[0-9]{3}-[0-9]{3}-[0-9]{4}$ xxx-xxx-xxxx
# grep -P 匹配正则
cat file.txt | grep -P "^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$|^[0-9]{3}-[0-9]{3}-[0-9]{4}$"