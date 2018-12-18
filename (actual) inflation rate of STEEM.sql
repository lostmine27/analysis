/* Total_Author_SP, Total_Author_STEEM */

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SP = SUM(A.vesting_payout) * 497 / 1000000, Total_Author_STEEM = SUM(A.steem_payout)
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlinK
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-31' AND '2018-12-17'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

/* SBD_Conversion_Amount */

SELECT CONVERT(CHAR(10), timestamp, 23), SUM(amount)
FROM TxConverts
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2017-12-31' AND '2018-12-17'
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY CONVERT(CHAR(10), timestamp, 23) ASC

/* Total_Author_SBD */

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Total_Author_SBD = SUM(A.sbd_payout)
FROM VOAuthorRewards AS A INNER JOIN Comments AS C ON A.author = C.author AND A.permlink = C.permlinK
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2017-12-31' AND '2018-12-17'
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

/* SBD_to_Null_Amount */

SELECT CONVERT(CHAR(10), timestamp, 23), SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-03-24' AND '2018-12-17' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY CONVERT(CHAR(10), timestamp, 23) ASC

