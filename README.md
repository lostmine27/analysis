<html>

<h2>Repository</h2>
<p><a href="https://github.com/lostmine27/analysis">https://github.com/lostmine27/analysis</a> &nbsp;</p>

<p>&nbsp;Analyzing how Steem Inc.'s major account balances fluctuate in 2018 will be quite useful in understanding the current status of the STEEM blockchain.&nbsp;</p>

<h2>Aim of Analysis</h2>
<p>The aim of this analysis is to establish&nbsp;</p>

<p>1. &nbsp;Steem Inc.'s major accounts balance change in 2018</p>
<p>2. Significant changes in major account balances</p>
<p>3. Weight of balance left out of steem ecosystem</p>
<p>4. Change in balance of @ned account, CEO of Steem Inc.</p>

![333.png](https://ipfs.busy.org/ipfs/QmSShnkbf2av1JFDnnqRqpvFTuyBkfNPq7Q3PVErid7AcP)

## ① Balance changes of Steem Inc.'s major accounts, 2018 YTD
<br>

Currently Steem Inc.'s key account balance is as follows. I excluded other minor accounts.

![1.png](https://ipfs.busy.org/ipfs/QmPc32mJtPDYJKrSazjtTjr5eQqZeQytn8EvMCwm3FSDr1)*<Source : steemsql>*

What is important is how much these numbers have changed from the end of last year.

To find out, I looked through all of the major accounts' 2018 transfers and then compared them to their current balance.

![2-1.png](https://ipfs.busy.org/ipfs/QmTZf3PtEWUpAu3E5XwnQAGdiDMH25BsJJtFfM2cP7J993)
*<Source : steemsql, unit : 10K>*

The annual changes in major accounts are shown in the table above. There have been a lot of changes.

<hr>

## ② Significant changes in major account balances
<br>

The @steemit account had a reduction of about twenty-fifty million (steem + sp)

Where did the reduced amount go?

![2.png](https://ipfs.busy.org/ipfs/QmTAcpqXJZFKNZVJraRgp87ey2KQk7Ms2PUQMizbgvBKxJ)
*<Source : steemsql, unit : 10K>*

As you can see in the chart above, about 11.5 million were added to the @misterdelegation account.

@misterdelegation is an account that helps grow the business by delegating SP to the main dapp of the steem block chain. It is an account that can be considered a kind of Steem Strategy Chief.

@dtube, @steemhunt and many others are growing with SP delegation of @misterdelegation.

Approximately 4.14 million have been moved to the @steem account. The steem account has used SP to create accounts for many new members and to lease a few SP to make those accounts active.

In addition, the @steemit2, @steemit3, @alpha, and @val-b accounts have decreased by about 1.54 million, which is a minor change but not an important part.

These accounts are, in the end, because they have a temporary account to manage Steem Inc's funds.

<hr>

## ③ Weight of balance left out of steem ecosystem
<br>

By the way, it is a bit strange.

Approximately twenty-fifty million disappeared from the @steemit account, but only about 14 million were returned, even though all the other major account changes were merged.

Where have the 11 million deficient ones gone? Yes, it is out of control by Steem Inc.

![3-1.png](https://ipfs.busy.org/ipfs/QmToyXJ77MeJH9kWm8W5YXUdq3Ra2c9F5oZGQcVSo57uhT)
*<Source : steemsql, unit : 10K>*

It is estimated that about 11 million units were spent on Steem Inc.'s operating funds.

Maybe some are still in the exchange (like bittrex).

![3.png](https://ipfs.busy.org/ipfs/QmdHSg3mWNeVkQC6qnvFBb2XiUtnNHUXxUUWpcpkEXPsEW)
*<Source : steemsql, unit : 10K>*

About 85% of the 11 million leaked from the Steem ecosystem left the @alpha account.

![4-1.png](https://ipfs.busy.org/ipfs/Qmbm7d2NCvJyQSiYvo5sUvfAh7dfuqFKuVDsZwSu7AMZr7)
*<Source : steemsql, unit : 10K>*

As a result, in 2018, about 56% of the approximately 25 million declines in the @steemit account are used for the growth of the steem ecosystem, and 44% can be considered to have flowed out of the steem ecosystem.

![4.png](https://ipfs.busy.org/ipfs/Qmc81xmY1y5WpxvS6mvWfNks13Jnf3uCFr1j9HhnQ4SF4J)
*<Source : steemsql, unit : 10K>*

<hr>

## ④ Change in balance of @ned account, CEO of Steem Inc
<br>

The CEO of Steem Inc., the @ned account, has also leaked about 1.95 million out of the steem ecosystem.

![3-2.png](https://ipfs.busy.org/ipfs/QmQX4Qw6qSG78QYPRdSZ83uYuZ3cMLXH8SMFVnKk1GYrmr)
*<Source : steemsql, unit : 10K>*

If the @ned account is also seen as the core account of Steem Inc., the balance of the major accounts of Steem.Inc. Will increase to about 27.02 million balances.

![5-1.png](https://ipfs.busy.org/ipfs/QmQ3JLCd2LVegzaGeyH6QDa2XJbir3H1J8YjjZVQcUP5qQ)
*<Source : steemsql, unit : 10K>*

<hr>

## Conclusion
<br>

Approximately 52% of them were used inside steem, and about 48% of them could be leaked out of the steem.

![5.png](https://ipfs.busy.org/ipfs/QmPsQV4KeW1zepiQSxCNcQFiHZLPp7DYCuVCQtCTEwsM4T)
*<Source : steemsql, unit : 10K>*

More precisely, Steem Inc.'s stake may have been partially transferred to other common steemians. I think that Steem Inc's stake is slightly reduced, and it seems that there are both advantages and disadvantages.

<hr>

I hope this analysis has helped you a little, and I wish the steem blockchain to continue to grow.

Thank you.

<h2>The Data and Queries</h2>
<p>I did this analysis by connecting to the steemsql db in @arcange with MSSQL client(Microsoft SQL server management studio) and then running the query.</p>

<br>

<p>for currently Steem Inc.'s key account balance</p>
<pre><code>select name, vesting_shares, delegated_vesting_shares, received_vesting_shares,
balance, savings_balance, sbd_balance, savings_sbd_balance
from Accounts
where name = CONVERT(CHAR, 'steemit')</code></pre>

<br>

<p>delegation history of Steem Inc's key account</p>
<pre><code>select delegator,delegatee,vesting_shares,timestamp=CONVERT(CHAR(10),timestamp,23)
from TxDelegateVestingShares
where delegator = CONVERT(CHAR, 'misterdelegation') /*and delegatee = CONVERT(CHAR, 'steem')*/
and vesting_shares > '0'
order by timestamp desc</code></pre>

<br>

<p>2018 Transfers of Steem Inc's key account</p>
<pre><code>select type, SENDER=CONVERT(CHAR,"from"),RECEIVER=CONVERT(CHAR,"to"),amount,amount_symbol,TIME=CONVERT(CHAR(10),timestamp,23)
from TxTransfers
where timestamp >= CONVERT(CHAR(10), '2018-01-01', 23)
and CONVERT(CHAR,"from") = 'steemit'
order by type,
timestamp desc</code></pre>

<p><br></p>
</html>

<hr>
