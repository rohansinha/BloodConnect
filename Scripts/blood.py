import json, web, threading, pymongo

client = pymongo.MongoClient()
db = client.bcdb
users_collection = db.users
history_collection = db.collection
emails = []

def fetch():
	#try:
    #	connection = pymongo.MongoClient()
    #	print "Connected successfully!!!"
	#except pymongo.errors.ConnectionFailure, e:
   	#	print "Could not connect to MongoDB: %s" % e 
   	response = []
   	for x in users_collection.find():
   		#temp = x
   		#temp['_id'] = 
   		response.append(x['name'])
	return response

def validate(data):
	print data
	a = json.loads(data)
	return a

def duplicate(inputData):
	e = inputData['email']
	p = inputData['contact']
	emails = []
	phones = []
	for x in users_collection.find():
   		emails.append(x['email'])
   		phones.append(x['contact'])
   	if e in emails or p in phones:
   		return True
   	else:
   		return False

urls = (
	'/', 'index',
	'/response', 'resp')

class index:
	def GET(self):
		web.header('Content-Type', 'application/json')
		return json.dumps(fetch())

class resp:
	def POST(self):
		jsonResponse = validate(web.data())
		if duplicate(jsonResponse):
			#send error code
			print "Account Already Exists"
		else:
			users_collection.insert(jsonResponse)
		print(jsonResponse)

if __name__ == "__main__":
		app = web.application(urls, globals())
		app.run()