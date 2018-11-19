/* Holding REAL_SBD_BALANCE(=SBD+SAVINGS_SBD) Amounts Ranking */

SELECT name,
REAL_SBD_BALANCE = CONVERT(INT,LEFT(SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance), LEN(sbd_balance)),PatIndex('%[^0-9]%', SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance),  LEN(sbd_balance)))-1 ))
+ CONVERT(INT, LEFT(SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance), LEN(savings_sbd_balance)),PatIndex('%[^0-9]%', SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance),  LEN(savings_sbd_balance)))-1 ))
FROM Accounts
ORDER BY REAL_SBD_BALANCE DESC

/* SBD Conversion Amount Ranking by Owner */

SELECT owner, Conversion_Numbers = COUNT(owner), Conversion_Amount = SUM(amount)
FROM TxConverts
WHERE timestamp between '2018-08-10' and '2018-11-19'
GROUP BY owner
ORDER BY sum(amount) desc

SELECT owner, Conversion_Numbers = COUNT(owner), Conversion_Amount = SUM(amount)
FROM TxConverts
WHERE timestamp between '2018-09-24' and '2018-11-19'
GROUP BY owner
ORDER BY sum(amount) desc

/* SBD Conversion Amount by period */
SELECT SUM(amount) FROM TxConverts WHERE timestamp between '2018-01-01' and '2018-11-19'

SELECT SUM(amount) FROM TxConverts WHERE timestamp between '2018-08-10' and '2018-11-19'

SELECT SUM(amount) FROM TxConverts WHERE timestamp between '2018-09-24' and '2018-11-19'
