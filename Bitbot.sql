/* 1. Daily Trend of SP Delegation Size and Number of Delegated Accounts */

SELECT D_ate = CONVERT(CHAR(10), q.timestamp, 23), Total_delegated_SP = SUM(q.SP), Number_of_Delegator = COUNT(delegator), Number_of_Unique_Delegator = COUNT(DISTINCT(delegator))
FROM (  
    SELECT delegator, delegatee, SP = vesting_shares * 497 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator, delegatee ORDER BY timestamp DESC) AS RowN
    FROM TxDelegateVestingShares
	WHERE delegatee IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
						'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
						'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
						'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
						'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
						'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
						'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
						'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
						'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
						'boomerang' ,'buildawhale')
	) as q
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' AND RowN = 1 AND SP > 0 
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY D_ate ASC

/* FOR CROSS CHECK : Current delegated SP to bidbots */

SELECT Account = name, Delegated_SP = CONVERT(FLOAT, LEFT(received_vesting_shares, CHARINDEX(' ', (received_vesting_shares))-1)) * 497 / 1000000
FROM Accounts
WHERE name IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
				'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
				'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
				'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
				'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
				'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
				'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
				'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
				'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
				'boomerang' ,'buildawhale')
ORDER BY Delegated_SP DESC

/* Status of Bidbots : Owned_SP of bidbots */

SELECT Account = name, Owned_SP = CONVERT(FLOAT, LEFT(vesting_shares, CHARINDEX(' ', (vesting_shares))-1)) * 497 / 1000000
FROM Accounts
WHERE name IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
				'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
				'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
				'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
				'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
				'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
				'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
				'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
				'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
				'boomerang' ,'buildawhale')
ORDER BY Owned_SP DESC

/* 2. Daily Curation Rewards Trend: bitbots vs entire STEEM */

SELECT Curation_Day = CONVERT(CHAR(10), timestamp, 23), Curation_SP = SUM(CONVERT(FLOAT,LEFT(SubString(reward, PatIndex('%[0-9]%', reward), LEN(reward)),PatIndex('%[^0-9]%', SubString(reward, PatIndex('%[0-9]%', reward),  LEN(reward)))-1 ))) * 497 / 1000000
FROM VOCurationRewards
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' 
AND curator IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
				'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
				'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
				'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
				'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
				'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
				'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
				'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
				'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
				'boomerang' ,'buildawhale')
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY CONVERT(CHAR(10), timestamp, 23) ASC

SELECT Curation_Day = CONVERT(CHAR(10), timestamp, 23), Curation_SP = SUM(CONVERT(FLOAT,LEFT(SubString(reward, PatIndex('%[0-9]%', reward), LEN(reward)),PatIndex('%[^0-9]%', SubString(reward, PatIndex('%[0-9]%', reward),  LEN(reward)))-1 ))) * 497 / 1000000
FROM VOCurationRewards
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' 
GROUP by CONVERT(CHAR(10), timestamp, 23)
ORDER BY CONVERT(CHAR(10), timestamp, 23) ASC

/* 3. Delegated SP	RANK to Bidbots by accounts */

SELECT Delegator = delegator, Total_Delegated_SP = sum(SP)
FROM (  
    SELECT delegator, delegatee, SP = vesting_shares * 497 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator, delegatee ORDER BY timestamp DESC) AS RowN
    FROM TxDelegateVestingShares
	WHERE delegatee IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
						'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
						'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
						'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
						'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
						'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
						'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
						'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
						'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
						'boomerang' ,'buildawhale')
						) as Q
WHERE CONVERT(CHAR(10), Q.timestamp, 23) BETWEEN '2016-03-24' AND '2018-12-30' AND Q.RowN = 1 AND Q.SP > 0 
GROUP BY delegator
ORDER BY sum(SP) DESC, delegator ASC

/* 4. Daily Author Rewards Trend: using bidbots vs entire steem */

SELECT Claimed_Day = CONVERT(CHAR(10), A.timestamp, 23),Author_SP = SUM(DISTINCT(A.vesting_payout)) * 497 / 1000000
FROM VOAuthorRewards AS A INNER JOIN TxVotes AS V ON V.permlink = A.permlink
WHERE CONVERT(CHAR(10), A.timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' 
AND V.voter IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
				'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
				'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
				'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
				'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
				'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
				'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
				'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
				'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
				'boomerang' ,'buildawhale')
GROUP BY CONVERT(CHAR(10), A.timestamp, 23)
ORDER BY CONVERT(CHAR(10), A.timestamp, 23) ASC

SELECT Claimed_Day = CONVERT(CHAR(10), timestamp, 23), Author_SP = SUM(vesting_payout) * 497 / 1000000
FROM VOAuthorRewards
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' 
GROUP by CONVERT(CHAR(10), timestamp, 23)
ORDER BY CONVERT(CHAR(10), timestamp, 23) ASC

/* 5. Daily trend of vote-selling VS bidbot to smartseem */

SELECT D_ate = CONVERT(CHAR(10), q.timestamp, 23), Total_delegated_SP = SUM(q.SP), Number_of_Delegator = COUNT(delegator), Number_of_Unique_Delegator = COUNT(DISTINCT(delegator))
FROM (  
    SELECT delegator, delegatee, SP = vesting_shares * 497 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator, delegatee ORDER BY timestamp DESC) AS RowN
    FROM TxDelegateVestingShares
	WHERE delegatee IN ('smartsteem')
	) as q
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' AND RowN = 1 AND SP > 0 
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY D_ate ASC

SELECT D_ATE = CONVERT(CHAR(10), timestamp, 23), Estimated_Revenue_of_Vote_Seller_to_SMARTSTEEM = SUM(DISTINCT(amount)), Estimated_Number_of_Vote_Seller_to_SMARTSTEEM = COUNT(DISTINCT([to]))
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' AND [from] IN ('smartsteem', 'smartmarket') AND amount > 0.01 AND amount_symbol = 'STEEM' AND [to] NOT IN (SELECT q.delegator
				FROM (  
					SELECT delegator, SP = vesting_shares * 497 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator, delegatee ORDER BY timestamp DESC) AS RowN
					FROM TxDelegateVestingShares
					WHERE delegatee IN ('smartsteem', 'smartmarket')
					) as q
				WHERE q.RowN = 1 AND q.SP > 0)
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY D_ATE ASC

SELECT D_ATE = CONVERT(CHAR(10), timestamp, 23), Estimated_Revenue_of_Delegator_to_SMARTSTEEM = SUM(DISTINCT(amount)), Estimated_Number_of_Delegator_to_SMARTSTEEM = COUNT(DISTINCT([to]))
FROM TxTransfers
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' AND [from] IN ('smartsteem', 'smartmarket') AND amount > 0.01 AND amount_symbol = 'STEEM' AND [to] IN (SELECT q.delegator
				FROM (  
					SELECT delegator, SP = vesting_shares * 497 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator, delegatee ORDER BY timestamp DESC) AS RowN
					FROM TxDelegateVestingShares
					WHERE delegatee IN ('smartsteem', 'smartmarket')
					) as q
				WHERE q.RowN = 1 AND q.SP > 0)
GROUP BY CONVERT(CHAR(10), timestamp, 23)
ORDER BY D_ATE ASC

/* Bitbot list based on steembottracker.com */

'upmewhale',	'appreciator',	'rocky1',	'upme',	'smartsteem',	'buildawhale',	'booster',	'therising',	'smartmarket',	'minnowbooster',	'tipu',
'bdvoter',	'rewards-pool',	'treeplanter',	'lays',	'originalworks',	'minnowpond',	'drotto',	'byresteem',	'promotedpost',	'siditech',	'blissfish',
'postdoctor',	'steemvote',	'hottopic',	'withsmn',	'bumper',	'thundercurator',	'morwhale',	'upvotewhale',	'steemlike',	'big-whale',	'botcoin',
'followforupvotes',	'coolbot',	'friends-bot',	'blockgators',	'earthnation-bot',	'tisko',	'resteemable',	'microbot',	'steemvoter',	'upvotebank',
'kiwibot',	'refresh',	'echowhale',	'flagship',	'bidseption',	'resteemr',	'bubblebee',	'cleansingpoetry',	'okankarol',	'crystalhuman',
'moonbot',	'zerotoherobot',	'resteembot',	'hugewhale',	'schoolofminnows',	'mecurator',	'superbot',	'resteemyou',	'steemthat',
'red-rose',	'reblogit',	'earnmoresteem',	'frontrunner',	'queqtra',	'photocontests',	'ottoman',	'fresteem',	'oceansbot',	'otobot',
'postresteem',	'talhadogan',	'danzy',	'giftbox',	'growingpower',	'jeryalex',	'highvote',	'drewardsresteem',	'bestvote',	'bidbot',
'thehumanbot',	'astrobot',	'alphaprime',	'gangvote'

/* Bitbot list based on @paulag (18.12.30) : I used this one */

('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
'boomerang' ,'buildawhale')