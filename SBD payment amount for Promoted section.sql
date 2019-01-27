/* SBD payment amount for promotion by year */

SELECT  Year = DATEPART(YY, timestamp), SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-03-24' AND '2019-01-26' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY DATEPART(YY, timestamp)
ORDER BY DATEPART(YY, timestamp)

/* SBD payment amount for promotion by month */

SELECT  Month = DATEPART(MM, timestamp), SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-01-01' AND '2016-12-31' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY DATEPART(MM, timestamp)
ORDER BY Month

SELECT  Month = DATEPART(MM, timestamp), SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2017-01-01' AND '2017-12-31' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY DATEPART(MM, timestamp)
ORDER BY Month

SELECT  Month = DATEPART(MM, timestamp), SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY DATEPART(MM, timestamp)
ORDER BY Month

SELECT  Month = DATEPART(MM, timestamp), SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2019-01-01' AND '2019-01-26' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY DATEPART(MM, timestamp)
ORDER BY Month

/* SBD payment amount for promotion by day */

SELECT Day = CONVERT(CHAR(10), timestamp, 23), SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-03-24' AND '2019-01-26' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY CONVERT(CHAR(10), timestamp, 23) ASC

/* SBD payment TOP 20 accounts for PR (All periods) */

SELECT TOP 20 [from], SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-03-24' AND '2019-01-26' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY [from]
ORDER BY SBD DESC

/* SBD payment TOP 20 accounts for PR (2018.01.01~2019.01.28) */

SELECT TOP 20 [from], SBD = SUM(amount)
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2019-01-26' AND [to] = 'null' AND amount_symbol = 'SBD'
GROUP BY [from]
ORDER BY SBD DESC


