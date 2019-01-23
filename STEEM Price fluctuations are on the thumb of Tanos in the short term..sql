/* 1. STEEM inflows, outflows of @bithumb.live */ 

SELECT Accounts_from = [from], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [to] = 'bithumb.live' AND CONVERT(CHAR(10), timestamp, 23) BETWEEN '2019-01-13' AND '2019-01-23' AND amount_symbol = 'STEEM'
GROUP BY [from]
ORDER BY SUM_AMOUNT DESC

SELECT Accounts_to = [to], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [from] = 'bithumb.live' AND CONVERT(CHAR(10), timestamp, 23) BETWEEN '2019-01-13' AND '2019-01-23' AND amount_symbol = 'STEEM'
GROUP BY [to]
ORDER BY SUM_AMOUNT DESC

/* 2. STEEM inflows, outflows of @upbitsteemhot */ 

SELECT Accounts_from = [from], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [to] = 'upbitsteemhot' AND CONVERT(CHAR(10), timestamp, 23) BETWEEN '2019-01-13' AND '2019-01-23' AND amount_symbol = 'STEEM'
GROUP BY [from]
ORDER BY SUM_AMOUNT DESC

SELECT Accounts_to = [to], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [from] = 'upbitsteemhot' AND CONVERT(CHAR(10), timestamp, 23) BETWEEN '2019-01-13' AND '2019-01-23' AND amount_symbol = 'STEEM'
GROUP BY [to]
ORDER BY SUM_AMOUNT DESC

/* 2. Other accounts : @bithumb.hot, @buthumb.sunshine, @s7eem-6i7humb */ 

SELECT Accounts_from = [from], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [to] = 'bithumb.sunshine' AND amount_symbol = 'STEEM'
GROUP BY [from]
ORDER BY SUM_AMOUNT DESC

SELECT Accounts_to = [to], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [from] = 'bithumb.sunshine' AND amount_symbol = 'STEEM'
GROUP BY [to]
ORDER BY SUM_AMOUNT DESC

SELECT Accounts_from = [from], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [to] = 'bithumb.hot' AND amount_symbol = 'STEEM'
GROUP BY [from]
ORDER BY SUM_AMOUNT DESC

SELECT Accounts_to = [to], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [from] = 'bithumb.hot' AND amount_symbol = 'STEEM'
GROUP BY [to]
ORDER BY SUM_AMOUNT DESC

SELECT Accounts_from = [from], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [to] = 's7eem-6i7humb' AND amount_symbol = 'STEEM'
GROUP BY [from]
ORDER BY SUM_AMOUNT DESC

SELECT Accounts_to = [to], SUM_AMOUNT = SUM(amount)
FROM TxTransfers
WHERE [from] = 's7eem-6i7humb' AND amount_symbol = 'STEEM'
GROUP BY [to]
ORDER BY SUM_AMOUNT DESC

/* 4. For detail check */

SELECT *
FROM TxTransfers
WHERE [from] = 'bittrex' AND [to] = 'upbitsteemhot' AND CONVERT(CHAR(10), timestamp, 23) BETWEEN '2019-01-13' AND '2019-01-23' AND amount_symbol = 'STEEM'
ORDER BY amount DESC

SELECT *
FROM TxTransfers
WHERE [from] = 'upbitsteemhot' AND [to] = 'bittrex' AND CONVERT(CHAR(10), timestamp, 23) BETWEEN '2019-01-13' AND '2019-01-23' AND amount_symbol = 'STEEM'
ORDER BY amount DESC