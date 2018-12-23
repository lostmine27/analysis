/* Number of daily account creation */

SELECT Created_date = CONVERT(CHAR(10), created, 23), Created_Accounts = COUNT(name)
FROM Accounts
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2016-03-24' AND '2018-12-21'
GROUP BY Created_date
ORDER BY Created_date ASC

/* Number of daily account created but never used */

SELECT Created_date = CONVERT(CHAR(10), created, 23), Never_Used_Accounts = COUNT(name)
FROM Accounts
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2016-03-24' AND '2018-12-21' AND CONVERT(CHAR(10), last_vote_time, 23) = '1970-01-01' AND CONVERT(CHAR(10), last_account_update, 23) = '1970-01-01'
GROUP BY Created_date
ORDER BY Created_date ASC

/* Recovery account & number of accounts that created but never voted or updated */

SELECT recovery_account, Never_Voted_and_Updated_Accounts = COUNT(*)
FROM Accounts
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2016-03-24' AND '2018-12-21' AND CONVERT(CHAR(10), last_vote_time, 23) = '1970-01-01' AND CONVERT(CHAR(10), last_account_update, 23) = '1970-01-01'
GROUP BY recovery_account
ORDER BY Never_Voted_and_Updated_Accounts desc

/* Owned SP & number of accounts that created but never voted or updated and recovery account is 'steem' */

SELECT recovery_account, Never_Voted_and_Updated_Accounts = COUNT(*), SUM(CONVERT(FLOAT,LEFT(SubString(vesting_shares, PatIndex('%[0-9]%', vesting_shares), LEN(vesting_shares)),PatIndex('%[^0-9]%', SubString(vesting_shares, PatIndex('%[0-9]%', vesting_shares),  LEN(vesting_shares)))-1 ))) * 497 / 1000000
FROM Accounts
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2016-03-24' AND '2018-12-21' AND CONVERT(CHAR(10), last_vote_time, 23) = '1970-01-01' AND CONVERT(CHAR(10), last_account_update, 23) = '1970-01-01' AND recovery_account = 'steem'
GROUP BY recovery_account
ORDER BY Never_Voted_and_Updated_Accounts desc

/* Effective SP & number of accounts that created but never voted or updated and recovery account is 'steem' */

SELECT name, created, SP = CONVERT(FLOAT,LEFT(SubString(vesting_shares, PatIndex('%[0-9]%', vesting_shares), LEN(vesting_shares)),PatIndex('%[^0-9]%', SubString(vesting_shares, PatIndex('%[0-9]%', vesting_shares),  LEN(vesting_shares)))-1 )) * 497 / 1000000, Effective_SP = (CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) + CONVERT(FLOAT, LEFT(received_vesting_shares, CHARINDEX(' ', (received_vesting_shares))-1)) - CONVERT(FLOAT, LEFT(delegated_vesting_shares, CHARINDEX(' ', (delegated_vesting_shares))-1))) * 497 / 1000000, created, balance, savings_balance, sbd_balance, savings_sbd_balance, sbd_seconds, savings_sbd_seconds, reputation, last_post, last_root_post, last_account_update, last_owner_update, last_bandwidth_update
FROM Accounts
WHERE CONVERT(CHAR(10), created, 23) BETWEEN '2016-03-24' AND '2018-12-21' AND CONVERT(CHAR(10), last_vote_time, 23) = '1970-01-01' AND CONVERT(CHAR(10), last_account_update, 23) = '1970-01-01' AND recovery_account = 'steem'
ORDER BY SP desc