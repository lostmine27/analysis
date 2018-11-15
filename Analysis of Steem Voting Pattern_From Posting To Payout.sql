SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) BETWEEN 0 AND 604800 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) BETWEEN 0 AND 300 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 300 and 600 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 600 and 900 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 900 and 1200 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 1200 and 1800 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 1800 and 3600 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 3600 and 7200 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 7200 and 10800 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 10800 and 21600 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 21600 and 43200 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 43200 and 86400 AND C.DEPTH = '0'


SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 0 and 43200 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 0 and 86400 AND C.DEPTH = '0'


SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 86400 and 172800 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 172800 and 259200 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 259200 and 345600 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 345600 and 432000 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 432000 and 518400 AND C.DEPTH = '0'

SELECT COUNT(*)
FROM Comments AS C INNER JOIN TxVotes AS V ON C.author = V.author and C.permlink = V.permlink
WHERE V.timestamp BETWEEN '2018-10-03' AND '2018-11-14' AND DATEDIFF(SECOND, C.created, V.timestamp) between 518400 and 604800 AND C.DEPTH = '0'
