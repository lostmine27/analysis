select delegator,delegatee,vesting_shares,timestamp=CONVERT(CHAR(10),timestamp,23)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'misterdelegation') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '0'
order by vesting_shares desc

/* ���� �Ӵ볻�� Ȯ���ϱ� */

select delegator,delegatee,vesting_shares,timestamp=CONVERT(CHAR(10),timestamp,23)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'misterdelegation') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '0'
order by timestamp desc

select count(*)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'steem') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '5000'

/* steem �� �Ӵ� ���� Ȯ�� */

select type, SENDER=CONVERT(CHAR,"from"),RECEIVER=CONVERT(CHAR,"to"),amount,amount_symbol,TIME=CONVERT(CHAR(10),timestamp,23)
from TxTransfers
where timestamp >= CONVERT(CHAR(10), '2018-01-01', 23)
and CONVERT(CHAR,"from") = 'ned'
order by type,
timestamp desc

/* 2018�� ���������� ���� �ŷ����� */