/* 1. Daily trend of SBD Conversion number & Amount */

SELECT DATE = CONVERT(CHAR(10), timestamp, 23), Conversion_Number = COUNT(owner), Conversion_Amount = SUM(amount) /* owner, Conversion_Numbers = COUNT(owner), Conversion_Amount = SUM(amount) */
FROM TxConverts
WHERE timestamp between '2018-11-19 16:30:00.000' and '2019-01-18 17:00:00.000'
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY DATE DESC

/* 2. SBD Conversion Amount Ranking by Owner */

SELECT Accounts = owner, Conversion_Numbers = COUNT(owner), Conversion_Amount = SUM(amount)
FROM TxConverts
WHERE timestamp between '2018-11-19 16:30:00.000' and '2019-01-18 17:00:00.000'
GROUP BY [owner]
ORDER BY Conversion_Amount DESC

/* 3. Holding REAL_SBD_BALANCE(=SBD+SAVINGS_SBD) Amounts Ranking */

SELECT TOP 20 name,
REAL_SBD_BALANCE = CONVERT(INT,LEFT(SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance), LEN(sbd_balance)),PatIndex('%[^0-9]%', SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance),  LEN(sbd_balance)))-1 ))
+ CONVERT(INT, LEFT(SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance), LEN(savings_sbd_balance)),PatIndex('%[^0-9]%', SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance),  LEN(savings_sbd_balance)))-1 ))
FROM Accounts
ORDER BY REAL_SBD_BALANCE DESC