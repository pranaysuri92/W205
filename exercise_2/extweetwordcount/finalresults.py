import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
if len(sys.argv) == 2:
	word = str(sys.argv[1])
	words = word.replace("'"," ")
	cur.execute("SELECT count from tweetwordcount where word = '%s'"% (words))
	count = cur.fetchall()
	print "Total number of occurrences of "+word + ":" + str(count[0][0])
else:
        cur.execute("SELECT word, count from tweetwordcount order by word")
        records = cur.fetchall()
	for i in records:
		delim = ""
		if i != records[len(records)-1]:
			delim = ","
		print "("+str(i[0])+","+str(i[1])+")"+ delim,
conn.close()
