select delegator,delegatee,vesting_shares,timestamp=CONVERT(CHAR(10),timestamp,23)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'misterdelegation') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '0'
order by vesting_shares desc

/* 누적 임대내역 확인하기 */

select delegator,delegatee,vesting_shares,timestamp=CONVERT(CHAR(10),timestamp,23)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'misterdelegation') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '0'
order by timestamp desc

select count(*)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'steem') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '5000'

/* steem 의 임대 숫자 확인 */

select type, SENDER=CONVERT(CHAR,"from"),RECEIVER=CONVERT(CHAR,"to"),amount,amount_symbol,TIME=CONVERT(CHAR(10),timestamp,23)
from TxTransfers
where timestamp >= CONVERT(CHAR(10), '2018-01-01', 23)
and CONVERT(CHAR,"from") = 'ned'
order by type,
timestamp desc

/* 2018년 스팀계정들 간의 거래내역 */