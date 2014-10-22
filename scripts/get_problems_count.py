import sys
import requests
import subprocess
from lxml import html
from lxml import etree

contest_id = (sys.argv)[1]

task_url = "http://codeforces.com/contest/" +contest_id

response = requests.get(task_url)
if response.status_code != 200:
	print "Fetching Failed"
	print "Response Code = "+str(response.status_code)
	sys.exit()

html_content = html.document_fromstring(response.text)
node = html_content.find_class("table-form")[0]

node = node.getchildren()[0]
node = node.getchildren()[1]
node = node.getchildren()[0]

print len(node.getchildren())-1
