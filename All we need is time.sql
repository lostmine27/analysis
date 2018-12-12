/* Nominal_Feed_Price = Current Supply of SBD * 9 / Current Supply of STEEM */

/* Holding REAL_SBD_BALANCE(=SBD+SAVINGS_SBD) Amounts Ranking TOP 10 */

SELECT top 10 name,
REAL_SBD_BALANCE = CONVERT(INT,LEFT(SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance), LEN(sbd_balance)),PatIndex('%[^0-9]%', SubString(sbd_balance, PatIndex('%[0-9]%', sbd_balance),  LEN(sbd_balance)))-1 ))
+ CONVERT(INT, LEFT(SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance), LEN(savings_sbd_balance)),PatIndex('%[^0-9]%', SubString(savings_sbd_balance, PatIndex('%[0-9]%', savings_sbd_balance),  LEN(savings_sbd_balance)))-1 ))
FROM Accounts
ORDER BY REAL_SBD_BALANCE DESC

/* SBD Conversion Amount by Period */

SELECT Total_Conversion_Amount = SUM(amount)
FROM TxConverts
WHERE timestamp between '2018-11-19 16:30:00.000' and '2018-12-12 23:59:59.999'

/* SBD Conversion Amount Ranking by Owner */

SELECT owner, Conversion_Numbers = COUNT(owner), Conversion_Amount = SUM(amount)
FROM TxConverts
WHERE timestamp between '2018-11-19 16:30:00.000' and '2018-12-12 23:59:59.999'
GROUP BY owner
ORDER BY sum(amount) desc

