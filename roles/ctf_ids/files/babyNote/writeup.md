## babyNote

given the source code:

```=python
    timestamp = round(time.time(), 4)
    random.seed(timestamp)
    user_id = get_random_id()
    timestamp = round(time.time(), 4)
    post_at = datetime.datetime.fromtimestamp(timestamp,
    tz=datetime.timezone.utc).strftime('%Y-%m-%d %H:%M UTC')
    random.seed(user_id + post_at)
    note_id = get_random_id()
```

we know that it is possible to crack the user_id of admin.

```=python
import string
import random
def get_random_id():
    alphabet = list(string.ascii_lowercase + string.digits)
    return ''.join([random.choice(alphabet) for _ in range(32)])

target = "lj40n2p9qj9xkzy3zfzz7pucm6dmjg1u"
target2= "2021-01-15 02:29 UTC"
init = 1610677740.0
while 1:
    init += 0.0001
    timestamp = round(init,4)
    random.seed(timestamp)
    user_id = get_random_id()
    random.seed(user_id + target2)
    note_id = get_random_id()
    if note_id == target:
        print(user_id)
#7bdeij4oiafjdypqyrl2znwk7w9lulgn
        break
```

Then can visit secret notes via: http://ip:port/my_notes?id=7bdeij4oiafjdypqyrl2znwk7w9lulgn

It gives one secret url to include remote note. And we also know that only the localhost can visit the flag.
Thus it is a SSRF challenge.

The filter blocks inner ip, we include a remote url and make it 302 jump to http://127.0.0.1/flag. Solved.