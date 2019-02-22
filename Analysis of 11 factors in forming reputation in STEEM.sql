/* followers' SP SUM */

SELECT *
FROM (SELECT name = F.following, Followers_SP = SUM(CONVERT(FLOAT, LEFT(A.vesting_shares, CHARINDEX(' ', (A.vesting_shares))-1))) * 498.9 / 1000000
	  FROM Accounts AS A INNER JOIN Followers AS F ON A.name = F.follower
	  GROUP BY F.following
	 ) AS Q
WHERE Q.name IN (SELECT name FROM Accounts WHERE reputation >= 10000000000000 )
ORDER BY Q.name ASC

/* followers */

SELECT name = F.following, Followers = COUNT(F.following)
FROM Accounts AS A INNER JOIN Followers AS F ON A.name = F.following
WHERE A.reputation >= 10000000000000
GROUP BY F.following
ORDER BY F.following ASC

/* total_payout */

SELECT author, total_payout = SUM(+total_payout_value+pending_payout_value)
FROM Comments
WHERE author IN (SELECT name
				FROM Accounts
				WHERE reputation >= 10000000000000)
AND depth = 0
GROUP BY author
ORDER BY author ASC

/* total_vesting_payout_of_posts */

SELECT author, total_vesting_payout_of_posts = SUM(vesting_payout)
FROM VOAuthorRewards
WHERE author IN (SELECT name
				FROM Accounts
				WHERE reputation >= 10000000000000)
AND permlink IN (SELECT permlink
				FROM Comments
				WHERE depth = 0)
GROUP BY author
ORDER BY author ASC

/* created day */

SELECT name, datediff(dd, CONVERT(CHAR(10), created, 23), '2019-02-19')
FROM Accounts
WHERE reputation >= 10000000000000
ORDER BY name ASC

/* reputation score */

SELECT name, reputation
FROM Accounts
WHERE reputation >= 10000000000000
ORDER BY name ASC

/* posts */

SELECT author, posts = COUNT(*)
FROM Comments
WHERE author IN (SELECT name
				FROM Accounts
				WHERE reputation >= 10000000000000)
AND depth = 0
GROUP BY author
ORDER BY author ASC

/* replies */

SELECT author, replies = COUNT(*)
FROM Comments
WHERE author IN (SELECT name
				FROM Accounts
				WHERE reputation >= 10000000000000)
AND depth != 0
GROUP BY author
ORDER BY author ASC

/* owned SP */

SELECT name, CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) * 498.9 / 1000000
FROM Accounts
WHERE reputation >= 10000000000000
ORDER BY name ASC

/* effective SP */

SELECT name, ( CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) + CONVERT(FLOAT, LEFT(received_vesting_shares, CHARINDEX(' ', (received_vesting_shares))-1)) - CONVERT(FLOAT, LEFT(delegated_vesting_shares, CHARINDEX(' ', (delegated_vesting_shares))-1)) ) * 498.9 / 1000000
FROM Accounts
WHERE reputation >= 10000000000000
ORDER BY name ASC

/* SELF VOTES */

SELECT voter, COUNT(voter)
FROM TxVotes
WHERE voter IN (SELECT [name]
				FROM Accounts
				WHERE reputation >= 10000000000000)
AND voter = author
GROUP BY voter
ORDER BY voter ASC