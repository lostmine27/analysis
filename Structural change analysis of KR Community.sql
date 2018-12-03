/* Comments_KR, Posts_KR, Replies_KR = Comments_KR - Posts_KR, Comments per post = Replies_KR / Posts_KR */

SELECT D = CONVERT(CHAR(10), created, 23), Comment_KR = COUNT(*)
FROM Comments
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01' AND category = 'kr'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

SELECT D = CONVERT(CHAR(10), created, 23), Posts_KR = COUNT(*)
FROM Comments
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01' AND category = 'kr' AND depth = '0'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

/* Comments_ALL, Posts_ALL, Replies_ALL = Comments_ALL - Posts_ALL, Comments per post = Replies_ALL / Posts_ALL */

SELECT D = CONVERT(CHAR(10), created, 23), Posts_KR = COUNT(*)
FROM Comments
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

SELECT D = CONVERT(CHAR(10), created, 23), Posts_ALL = COUNT(*)
FROM Comments
WHERE depth = '0' AND CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

/* The ratio of author rewards that the KR community has taken over the entire Steemit = KR / ALL */

/* KR = Total Claimed Author Rewards of KR */

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

/* ALL = Total Claimed Author Rewards of ALL Steemit */

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlinK
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

/* Posts & Authors of KR, ALL Steemit */

SELECT COUNT(*), COUNT(DISTINCT(author))
FROM Comments
WHERE depth = '0' AND json_metadata LIKE ('%"kr",%') AND CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

SELECT COUNT(*), COUNT(DISTINCT(author))
FROM Comments
WHERE depth = '0' AND CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC



SELECT COUNT(*)
FROM Comments
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

/* Categories of Posts of KR community

SELECT *
FROM Comments
WHERE CONVERT(CHAR(10), created, 23) = '2018-11-01' AND depth >= '168'

SELECT COUNT(*)
FROM Comments
WHERE depth = '1' AND json_metadata LIKE ('%"kr",%') AND CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

SELECT COUNT(*)
FROM Comments
WHERE depth NOT IN ('%1%') AND json_metadata LIKE ('%"kr",%') AND CONVERT(CHAR(10), created, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), created, 23)
ORDER BY CONVERT(CHAR(10), created, 23) ASC

SELECT *
FROM VOAuthorRewards
WHERE author = 'lostmine27'

SELECT CONVERT(CHAR(10), A.timestamp, 23), SUM(A.author.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink
WHERE DATEDIFF(DAY, C.created, A.timestamp) BETWEEN 7 AND 8 AND CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2018-11-01' AND '2018-12-01' C.depth = '0' AND C.json_metadata LIKE ('%"kr",%')
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT CONVERT(CHAR(10), A.timestamp, 23), SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%')
WHERE A.timestamp BETWEEN '2018-11-23' AND '2018-12-01' AND C.depth = '0' 
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23), C.created, A.author, A.permlink, C.depth, C.title, Author_SP = A.vesting_payout * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) = '2018-11-23'




/* Total Claimed Curation Rewards of ALL, KR */

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Curation_SP = SUM(CONVERT(INT, A.reward)) * 495 / 1000000
FROM VOCurationRewards AS A INNER JOIN Comments AS C ON A.curator = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2018-11-30' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC


SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Curation_SP = SUM(CONVERT(CHAR(10), A.reward)) * 495 / 1000000
FROM VOCurationRewards AS A INNER JOIN Comments AS C ON A.curator = C.author AND A.permlink = C.permlink
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2018-11-30' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%') AND json_metadata LIKE ('%"steemmonsters",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%') AND json_metadata LIKE ('%"tasteem",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%') AND json_metadata LIKE ('%"tripsteem",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%') AND json_metadata LIKE ('%"actifit",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%') AND json_metadata LIKE ('%"artisteem",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 495 / 1000000
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlink AND json_metadata LIKE ('%"kr",%') AND json_metadata LIKE ('%"manamine",%')
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC



SELECT *
FROM TxTransfers
WHERE timestamp BETWEEN

SELECT [to], STEEM_Outflow = SUM(amount)

FROM TxTransfers
WHERE [from] = 'ned' AND amount_symbol = 'STEEM' AND [type] = 'transfer' AND timestamp BETWEEN '2016-03-24' AND '2018-12-01' 
GROUP BY [to]

ORDER BY SUM(amount) DESC

SELECT [from], SUM(amount)

FROM TxTransfers
WHERE [to] = 'ned' AND amount_symbol = 'STEEM' AND timestamp BETWEEN '2016-03-24' AND '2018-12-01'
GROUP BY [from]

ORDER BY SUM(amount) DESC

SELECT [to], SUM(amount)

FROM TxTransfers
WHERE [from] = 'alpha' AND amount_symbol = 'SBD' AND timestamp BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY [to]

ORDER BY SUM(amount) DESC

SELECT [from], SUM(amount)

FROM TxTransfers
WHERE [to] = 'alpha' AND amount_symbol = 'SBD' AND timestamp BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY [from]

ORDER BY SUM(amount) DESC

SELECT [to], SUM(amount)

FROM TxTransfers
WHERE [from] = 'steemit' AND amount_symbol = 'STEEM' AND timestamp BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY [to]

ORDER BY SUM(amount) DESC

SELECT [from], SUM(amount)

FROM TxTransfers
WHERE [to] = 'steemit' AND amount_symbol = 'STEEM' AND timestamp BETWEEN '2017-12-01' AND '2018-12-01'
GROUP BY [from]

ORDER BY SUM(amount) DESC


SELECT DISTINCT(V.voter)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE C.created BETWEEN '2018-11-27' AND '2018-11-28' AND C.DEPTH = '0' AND DATEDIFF(SECOND, C.created, V.timestamp) BETWEEN 0 AND 60 AND V.weight BETWEEN '0' AND '1000'
GROUP BY CONVERT(CHAR(10), V.timestamp, 23)
ORDER BY CONVERT(CHAR(10), V.timestamp, 23)

SELECT ACCOUNTS = name, Effective_SP = (CONVERT(FLOAT, LEFT(A.vesting_shares, CHARINDEX(' ', (A.vesting_shares))-1)) + CONVERT(FLOAT, LEFT(A.received_vesting_shares, CHARINDEX(' ', (A.received_vesting_shares))-1)) - CONVERT(FLOAT, LEFT(A.delegated_vesting_shares, CHARINDEX(' ', (A.delegated_vesting_shares))-1))) * 496.57570452855 / 1000000, A.created
FROM Accounts AS A INNER JOIN TxVotes AS V ON A.name = V.voter
WHERE (CONVERT(FLOAT, LEFT(A.vesting_shares, CHARINDEX(' ', (A.vesting_shares))-1)) + CONVERT(FLOAT, LEFT(A.received_vesting_shares, CHARINDEX(' ', (A.received_vesting_shares))-1)) - CONVERT(FLOAT, LEFT(A.delegated_vesting_shares, CHARINDEX(' ', (A.delegated_vesting_shares))-1))) * 496.57570452855 / 1000000 > 50000
AND V.timestamp BETWEEN '2018-11-27' AND '2018-11-28'
ORDER BY Effective_SP DESC

SELECT Total_rewards = COUNT(R.reward)
FROM Comments AS C INNER JOIN TxVotes AS V INNER JOIN VOCurationRewards AS R ON C.author = V.author AND C.permlink = V.permlink AND R.curator = V.voter and RC.author = V.author and R.permlink = V.permlink
WHERE CONVERT(CHAR(10), C.created, 23) = '2018-11-27' AND V.weight <= '1000' AND DATEDIFF(SECOND, C.created, V.timestamp) BETWEEN 0 AND 899 AND C.DEPTH = '0'

SELECT D = CONVERT(CHAR(10), V.timestamp, 23), COUNT(DISTINCT(V.voter))
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-27' AND DATEDIFF(SECOND, C.created, V.timestamp) BETWEEN 0 AND 899 AND C.DEPTH = '0'
GROUP BY V.voter
ORDER BY V.timestamp


SELECT DELEGATEE = delegatee, DRANK = SUM(vesting_shares)
FROM TxDelegateVestingShares
WHERE timestamp BETWEEN '2016-03-24' AND '2018-11-27' AND delegatee IN
('upmewhale','rocky1','booster','smartsteem','appreciator','buildawhale','therising','upme',
'postpromoter','tipu','bdvoter','treeplanter','lays','minnowpond','originalworks','drotto',
'kiwibot','steemvote','siditech','postdoctor','morwhale','withsmn','bumper','byresteem',
'thundercurator','promotedpost','steemlike','upvotewhale','blockgators','blissfish',
'followforupvotes','coolbot','botcoin','friends-bot','moonbot','earthnation-bot','microbot',
'resteemable','tisko','steemvoter','hottopic','refresh','flagship','upvotebank','echowhale',
'resteemr','bidseption','bubblebee','cleansingpoetry','crystalhuman','okankarol','big-whale',
'resteembot','mecurator','hugewhale','zerotoherobot','schoolofminnows','superbot','red-rose',
'steemthat','resteemyou','earnmoresteem','frontrunner','photocontests','ottoman','queqtra',
'highvote','fresteem','oceansbot','jeryalex','otobot','postresteem','talhadogan','danzy',
'giftbox','growingpower','drewardsrestee','bestvote','reblogit','bidbot','thehumanbot',
'astrobot','alphaprime','gangvote')
GROUP BY delegatee
ORDER BY DRANK DESC

SELECT WITHDRAW = from_account, WRANK = SUM(amount)
FROM VOreturnVestingDelegations
WHERE timestamp BETWEEN '2016-03-24' AND '2018-11-27' AND from_account IN
('upmewhale','rocky1','booster','smartsteem','appreciator','buildawhale','therising','upme',
'postpromoter','tipu','bdvoter','treeplanter','lays','minnowpond','originalworks','drotto',
'kiwibot','steemvote','siditech','postdoctor','morwhale','withsmn','bumper','byresteem',
'thundercurator','promotedpost','steemlike','upvotewhale','blockgators','blissfish',
'followforupvotes','coolbot','botcoin','friends-bot','moonbot','earthnation-bot','microbot',
'resteemable','tisko','steemvoter','hottopic','refresh','flagship','upvotebank','echowhale',
'resteemr','bidseption','bubblebee','cleansingpoetry','crystalhuman','okankarol','big-whale',
'resteembot','mecurator','hugewhale','zerotoherobot','schoolofminnows','superbot','red-rose',
'steemthat','resteemyou','earnmoresteem','frontrunner','photocontests','ottoman','queqtra',
'highvote','fresteem','oceansbot','jeryalex','otobot','postresteem','talhadogan','danzy',
'giftbox','growingpower','drewardsrestee','bestvote','reblogit','bidbot','thehumanbot',
'astrobot','alphaprime','gangvote')
GROUP BY from_account
ORDER BY WRANK DESC

SELECT *
FROM VOreturnVestingDelegations
WHERE account = 'lostmine27'

SELECT vesting_shares, delegated_vesting_shares, received_vesting_shares
FROM Accounts
WHERE name = 'ned'

SELECT ACCOUNTS = name, Effective_SP = (CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) + CONVERT(FLOAT, LEFT(received_vesting_shares, CHARINDEX(' ', (received_vesting_shares))-1)) - CONVERT(FLOAT, LEFT(delegated_vesting_shares, CHARINDEX(' ', (delegated_vesting_shares))-1))) * 496.57570452855 / 1000000, created
FROM Accounts
WHERE (CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) + CONVERT(FLOAT, LEFT(received_vesting_shares, CHARINDEX(' ', (received_vesting_shares))-1)) - CONVERT(FLOAT, LEFT(delegated_vesting_shares, CHARINDEX(' ', (delegated_vesting_shares))-1))) * 496.57570452855 / 1000000 > 50000
ORDER BY Effective_SP DESC

SELECT ACCOUNTS = name, Owned_SP = CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) * 496.57570452855 / 1000000, created
FROM Accounts
WHERE CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) * 496.57570452855 / 1000000 > 50000
ORDER BY Owned_SP DESC

SELECT ACCOUNTS = name, Effective_SP = (CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) + CONVERT(FLOAT, LEFT(received_vesting_shares, CHARINDEX(' ', (received_vesting_shares))-1)) - CONVERT(FLOAT, LEFT(delegated_vesting_shares, CHARINDEX(' ', (delegated_vesting_shares))-1))) * 496.57570452855 / 1000000, created
FROM Accounts
WHERE name = 'ned'

SELECT ACCOUNTS = name, Effective_STEEM = (CONVERT(FLOAT, LEFT(balance, CHARINDEX(' ', (balance))-1)) + CONVERT(FLOAT, LEFT(savings_balance, CHARINDEX(' ', (savings_balance))-1)) ), created
FROM Accounts
WHERE name = 'ned'

SELECT *
FROM Accounts
WHERE name = 'lostmine27'
('steempeak', 'partiko', 'actifit', 'utopian-io',
              'dtube', 'zappl', 'steemkr', 'steemeasy', 'artisteem',
              'parley', 'tasteem', 'steemauto', 'dlive', 'steepshot',
              'dsound', 'steemhunt', 'esteem', 'steemgig',
              'bescouted', 'busy.pay', 'dlike', 'ios-steemitapp', 'hede',
              'steem-plus-app', 'steemit', 'ulogs', 'dmania',
              'bsteem', 'steempress', 'dclick')

ORDER BY name ASC

