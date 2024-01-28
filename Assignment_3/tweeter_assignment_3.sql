-- 1. Fetch all users name from database.

SELECT name FROM Users;

-- 2. Fetch all tweets of user by user id most recent tweets first.

SELECT t.content, t.time, u.name
FROM Tweets t
JOIN Users u ON t.user_id = u.user_id
WHERE t.user_id = 2 -- Replace '2' with a user id which you are interested in.
ORDER BY t.time DESC;

-- 3. Fetch like count of particular tweet by tweet id.

SELECT COUNT(*) AS like_count
FROM Likes
WHERE tweet_id = 1; -- Replace '1' with the tweet id of a tweet on which you want to count likes.

-- 4. Fetch retweet count of particular tweet by tweet id.

SELECT COUNT(*) AS retweet_count
FROM Retweets
WHERE tweet_id = 1; -- Replace '1' with a tweet id you are interested in.

-- 5. Fetch comment count of particular tweet by tweet id.

SELECT COUNT(*) AS comment_count
FROM Comments 
WHERE parent_tweet_id = 2; -- Replace '2' with a tweet id you are interested in.

-- 6. Fetch all user’s name who have retweeted particular tweet by tweet id.

SELECT u.name
FROM Retweets r
JOIN Users u ON r.user_id = u.user_id
WHERE r.tweet_id = 1; -- Replace '1' with a tweet id you are interested in.

-- 7. Fetch all commented tweet's content for particular tweet by tweet id.

SELECT c.comment_id, c.tweet_id, c.parent_tweet_id, c.time, t.content AS commented_tweet_content
FROM Comments c
JOIN Tweets t ON c.tweet_id = t.tweet_id
WHERE c.parent_tweet_id = 2; -- Replace '2' with a tweet id you are interested in.

-- 8. Fetch user's timeline (All tweets from users whom I am following with tweet content and user name who has tweeted it)

SELECT t.content, t.time, u.name AS user_name
FROM Tweets t
JOIN Users u ON t.user_id = u.user_id
WHERE t.user_id IN (SELECT following_id FROM Follows WHERE follower_id = <your_user_id>) -- Replace <your_user_id> with the user ID of the person whose timeline you want to fetch.
ORDER BY t.time DESC;
