-- Data to be Inserted in tables

-- Users Table
INSERT INTO Users (user_id, name, email, phone_no) VALUES
(1, 'Vader', 'vader123@gmail.com', '8936784519'),
(2, 'Leia', 'leia987@gmail.com', '9274859022'),
(3, 'Obi-Wan', 'obi.wan@gmail.com', '6190654367');

-- Tweets Table
INSERT INTO Tweets (tweet_id, user_id, content) VALUES
(1, 1, 'I find your lack of faith disturbing.'),
(2, 3, 'The Force will be with you. Always.'),
(3, 2, "Help me, Obi-Wan Kenobi. You're my only hope.");

-- Likes Table
INSERT INTO Likes (like_id, user_id, tweet_ID) VALUES
(1, 2, 1);

-- Retweets Table
INSERT INTO Retweets (retweet_id, user_id, tweet_id) VALUES
(1, 3, 1);

-- Follows Table
INSERT INTO Follows (follow_id, follower_id, following_id) VALUES
(1, 2, 1),
(2, 1, 3);

-- Comments Table
INSERT INTO Comments (comment_id, tweet_id, parent_tweet_id) VALUES
(1, 3, 2);



