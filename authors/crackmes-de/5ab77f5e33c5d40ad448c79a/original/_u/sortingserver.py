#Fill in these values appropriately
server_name = 'localhost'
port = 8000

#############################################################################
#The important parts

#A secret 32bit unsigned integer. Noone will ever know!
flag = open('flag.txt','r').read()
flag = int(flag) % (1<<32)

#this class implements the same random number generator that glibc uses
class glibcRandom(object):
    def __init__(self, seed):
        self.x = seed
        self.a = 1103515245
        self.c = 12345
        self.m = 1<<32
        self.mask = (1<<30) - 1

    def next(self):
        self.x = (self.x * self.a + self.c) % self.m
        return self.x & self.mask

def quicksort_sub(vals, rand):
    if len(vals) <= 1:
        return vals
    if min(vals) == max(vals):
        return vals

    i = rand.next() % len(vals)
    pivot = vals[i]
    left = [x for x in vals if x<=pivot]
    right = [x for x in vals if x>pivot]
    return quicksort_sub(left, rand) + quicksort_sub(right, rand)

def quickSort(vals, seed):
    try:
        return quicksort_sub(vals, glibcRandom(seed))
    except BaseException as E:
        return 'An error occured while sorting your data'

#############################################################################
#Unimportant server stuff
import BaseHTTPServer, urlparse

def handleSort(datastr):
    try:
        arr = map(int, datastr.split(','))
    except BaseException as E:
        return 'Unable to parse input data'
    #Use a seed which the users can't guess
    result = quickSort(arr, seed=flag)
    return result

def handleFlag(datastr, tries=[0]):
    try:
        val = int(datastr,16) if datastr[:2] == '0x' else int(datastr)
    except BaseException as E:
        return 'Unable to parse input data'

    if tries[0] >= 5:
        return 'Sorry but you have tried to guess the flag too many times'
    elif val == flag:
        return 'Correct!'
    else:
        tries[0] += 1
        return 'Incorrect! You have {}/5 guesses remaining'.format(5-tries[0])
    
def displaySource(datastr):
    try:
        return open('sortingserver.py','r').read()
    except BaseException as E:
        return str(E)

handlers = {'sort':handleSort, 'checkFlag':handleFlag, 'displaySource':displaySource}

helpInfo = '''

Example queries:

{0}/?action=sort&data=1,5,23,4,-5,1
{0}/?action=checkFlag&data=1234567
{0}/?action=checkFlag&data=0xDEADBEEF
{0}/?action=displaySource'''.format('http://' + server_name + ':' + str(port))

class MyHandler(BaseHTTPServer.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()

        params = self.getQueryParams()
        datastr = params.get('data')
        action = params.get('action')
        if action in handlers:
            response = handlers[action]( datastr )
        elif action:
            template = 'Unrecognized action "{0}"\nAllowed actions are {1}'
            response = template.format(action, ', '.join(handlers))
            response += helpInfo
        else:
            response = "Welcome to Sally's Super Secure Sorting Service!\n"\
                       "Here you can get all your integers sorted. There is also a secret flag, but you'll never guess it!"
            response += helpInfo
        self.wfile.write(response)

    def getQueryParams(self):
        o = urlparse.urlparse(self.path)
        params = urlparse.parse_qs(o.query)
        return {k:v[0] for k,v in params.items()}

    #have to override this to prevent every request from being printed to stdout
    def log_message(self, *args):
        pass

def run(server_class=BaseHTTPServer.HTTPServer,
        handler_class=BaseHTTPServer.BaseHTTPRequestHandler):
    server_address = (server_name, port)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()

if __name__ == "__main__":
    run(handler_class = MyHandler)

