import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
if len(sys.argv) == 3:
	k1 = str(sys.argv[1])
	k2 = str(sys.argv[2])
	cur.execute("SELECT word, count from tweetwordcount where count >= %s and count <= %s"% (k1,k2))
	records = cur.fetchall()
	for i in records:
		print str(i[0])+": " + str(i[1])
		#print i
else:
	print "Please enter two integers as arguments."
conn.close()
