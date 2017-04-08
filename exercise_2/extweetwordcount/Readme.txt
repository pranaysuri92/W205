Step 1: Set up run postgres

Create postgres database for tcount and table tweetwordcount.

create database: CREATE DATABASE tcount;

creating table: CREATE TABLE tweetwordcount (word TEXT PRIMARY KEY NOT NULL, count INT NOT NULL);

Step 2: Run code

cd extweetwordcount

Run the storm topology: sparse run

Run final results: python finalresults.py

to get results for a specific word

or

python finalresults.py

to get all results

Run histogram:

python histogram.py k1 k2

where k1 is the lower bound for count and k2 is the upper bound for count
