import os
import time
import re
import base64
import random
import hashlib
import urllib.request
from socket import inet_aton, getaddrinfo
from struct import unpack
from urllib.parse import urlparse

def ip2long(ip_addr):    
	return unpack("!L", inet_aton(ip_addr))[0]

def is_inner_ipaddress(ip):
	ip = ip2long(ip)
	return ip2long('127.0.0.0') >> 24 == ip >> 24 or ip2long('10.0.0.0') >> 24 == ip >> 24 or ip2long('172.0.0.0') >> 24 == ip >> 24 or ip2long('192.168.0.0') >> 16 == ip >> 16
	
def strong_filter(url):
	hostname = urlparse(url).hostname
	try:
		if not re.match(r"^https?://.*/.*$", url):
			print("not match")
			return False
		ip_address = getaddrinfo(hostname, 'http')[0][4][0]
		print(ip_address)
		if is_inner_ipaddress(ip_address):       
			return False
		return True, "success"
	except:    
		return False, "unknow error"

def GetRemoteNote(url):
	if strong_filter(url):
		path = url
	else:
		return "oops. something goes wrong"
	try:
		content = urllib.request.urlopen(path).read()
	except:
		content = "urlopen error"
	print(content)
	return content