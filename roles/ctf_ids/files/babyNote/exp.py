#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 jyc <jiangyuancheng@126.com>
#
# Distributed under terms of the MIT license.


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

