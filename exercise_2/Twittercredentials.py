import tweepy

consumer_key = "MOyph0z8vLejyhIgGPSg44a2E";
#eg: consumer_key = "MOyph0z8vLejyhIgGPSg44a2E";


consumer_secret = "QfHlE1D8Kgz8NLNWih9qGSFUdTwEIIuJLH5S38n2vkdiNQnbvo";
#eg: consumer_secret = "QfHlE1D8Kgz8NLNWih9qGSFUdTwEIIuJLH5S38n2vkdiNQnbvo";

access_token = "849830842465624069-vghNwBXcbA3qVrxSrbE3UNZNlGapyHl";
#eg: access_token = "vghNwBXcbA3qVrxSrbE3UNZNlGapyHl";

access_token_secret = "4rMaY4jk0FJzcxe20fzANGwQXzzgj72w1ukhtBtawtswu";
#eg: access_token_secret = "4rMaY4jk0FJzcxe20fzANGwQXzzgj72w1ukhtBtawtswu";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



