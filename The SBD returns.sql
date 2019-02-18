/* Holding REAL_SBD_BALANCE(=SBD+SAVINGS_SBD) Amounts Ranking */

SELECT name, REAL_SBD_BALANCE = CONVERT(INT,LEFT(SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance), LEN(sbd_balance)),PatIndex('%[^0-9]%', SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance),  LEN(sbd_balance)))-1 ))
+ CONVERT(INT, LEFT(SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance), LEN(savings_sbd_balance)),PatIndex('%[^0-9]%', SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance),  LEN(savings_sbd_balance)))-1 ))
FROM Accounts
ORDER BY REAL_SBD_BALANCE DESC

/* SBD Conversion Amount Ranking by Owner */

SELECT owner, Conversion_Numbers = COUNT(owner), Conversion_Amount = SUM(amount)
FROM TxConverts
WHERE CONVERT(CHAR(10), timestamp, 23) between '2018-08-10' and '2019-02-18'
GROUP BY owner
ORDER BY sum(amount) desc

/* SBD Conversion Amount by Period */

SELECT CONVERT(CHAR(10), timestamp, 23), COUNT(owner), SUM(amount)
FROM TxConverts
WHERE CONVERT(CHAR(10), timestamp, 23) between '2018-08-10' and '2019-02-18'
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY CONVERT(CHAR(10), timestamp, 23) DESC

/* Daily SBD issuance trend */

SELECT DATE = CONVERT(CHAR(10), timestamp, 23), SBD_Issuance = SUM(sbd_payout)
FROM VOAuthorRewards
WHERE CONVERT(CHAR(10), timestamp, 23) between '2018-08-10' and '2019-02-18'
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY DATE DESC