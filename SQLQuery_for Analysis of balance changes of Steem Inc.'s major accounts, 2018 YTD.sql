select name, vesting_shares, delegated_vesting_shares, received_vesting_shares,
balance, savings_balance, sbd_balance, savings_sbd_balance
from Accounts
where name = CONVERT(CHAR, 'steemit')

/* Account balance */
/* 'steem','steemit','steemit2','steemit3','misterdelegation','alpha','val-b','ned' */

select delegator,delegatee,vesting_shares,timestamp=CONVERT(CHAR(10),timestamp,23)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'misterdelegation') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '0'
order by vesting_shares desc

/* delegation history */

select count(*)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'steem') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '5000'

/* count total delegation number of "steem" */

select type, SENDER=CONVERT(CHAR,"from"),RECEIVER=CONVERT(CHAR,"to"),amount,amount_symbol,TIME=CONVERT(CHAR(10),timestamp,23)
from TxTransfers
where timestamp >= CONVERT(CHAR(10), '2018-01-01', 23)
and CONVERT(CHAR,"from") = 'ned'
order by type,
timestamp desc

/* 2018 Transfers of Steem Inc's key account */
/* 'steem','steemit','steemit2','steemit3','misterdelegation','alpha','val-b','ned' */
