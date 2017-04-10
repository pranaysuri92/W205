from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]
	#print tup.values[0]
        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        # Connect to the database
	conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
	
	#write code to increment the word count in postgres
	#cur.execute("INSERT INTO tweetwordcount (word,count) VALUES ('test', 1)");
	#conn.commit()
	#conn.close()


	cur = conn.cursor()

	cur.execute("SELECT word, count from tweetwordcount")
	records = cur.fetchall()
	insert = True
	word = word.replace("'"," ")
	cur = conn.cursor()
	for rec in records:
		if word in rec[0]:
			cur.execute("UPDATE tweetwordcount SET count=%d WHERE word='%s'" % ( self.counts[word]+1,word))
			insert = False
	if insert == True :
		cur.execute("INSERT INTO tweetwordcount (word,count) VALUES ('%s', 1)" % (word));			
	conn.commit()

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])
	conn.close()
        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
