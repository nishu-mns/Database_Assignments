--Users table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
    phone_no VARCHAR(10) UNIQUE NOT NULL
);

--Tweets table
CREATE TABLE Tweets (
    tweet_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

--Likes table
CREATE TABLE Likes (
    like_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    tweet_ID INTEGER NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id)
);

--Retweets table
CREATE TABLE Retweets (
    retweet_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    tweet_id INTEGER NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id)
);

--Comments table
CREATE TABLE Comments (
    comment_id SERIAL PRIMARY KEY,
    tweet_id INTEGER UNIQUE NOT NULL,
    parent_tweet_id INTEGER,
    time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id),
    FOREIGN KEY (parent_tweet_id) REFERENCES Tweets(tweet_id)
);

--Follows table
CREATE TABLE Follows (
    follow_id SERIAL PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    following_id INTEGER NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (follower_id) REFERENCES Users(user_id),
    FOREIGN KEY (following_id) REFERENCES Users(user_id)
);