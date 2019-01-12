/* 1. Number of accounts initiated the first delegation, SP delegation size (by year) */

SELECT Year = DATEPART(yy,timestamp), Number_of_Unique_Delegator = COUNT(DISTINCT(delegator)), Total_delegated_SP = SUM(q.SP)
FROM (  
    SELECT delegator, delegatee, SP = vesting_shares * 497.66528369215 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator ORDER BY timestamp ASC) AS RowN
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
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-03-24' AND '2019-01-12' AND RowN = 1 AND SP > 0 
GROUP BY DATEPART(yy,timestamp)
ORDER BY DATEPART(yy,timestamp)

/* 2.  Number of accounts initiated the first delegation, SP delegation size (by month, 2018) */

SELECT Year = DATEPART(mm,timestamp), Number_of_Unique_Delegator = COUNT(DISTINCT(delegator)), Total_delegated_SP = SUM(q.SP)
FROM (  
    SELECT delegator, delegatee, SP = vesting_shares * 497.66528369215 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator ORDER BY timestamp ASC) AS RowN
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
GROUP BY DATEPART(mm,timestamp)
ORDER BY DATEPART(mm,timestamp)

/* 3. The number of accounts that currently maintain delegation, the SP delegation size (by month, year) */

SELECT COUNT(DISTINCT(Delegator)), SUM(SP)
FROM
(
	SELECT Date = CONVERT(CHAR(10), timestamp, 23), Delegator = delegator, Delegatee = delegatee, SP = vesting_shares * 497.66528369215 / 1000000, ROW_NUMBER() OVER (PARTITION BY delegator, delegatee ORDER BY timestamp DESC) AS RowN
	FROM TxDelegateVestingShares
	WHERE delegator IN (SELECT q.delegator
		FROM (  
			SELECT delegator, SP = vesting_shares * 497.66528369215 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator ORDER BY timestamp ASC) AS RowN
			FROM TxDelegateVestingShares
			WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-03-24' AND '2019-01-12' AND 
				delegatee IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
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
		WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2016-03-24' AND '2017-12-31' AND q.RowN = 1 AND q.SP > 0)
		AND delegatee IN ('tainika' ,'chronoboost' ,'getkarma' ,'weupvote' ,'alliedforces' ,'a-bot' ,'boinger' ,'jerrybanfield' ,'upyourpost' ,'pwrup' ,
							'brotherhood' ,'haveaheart' ,'alfanso' ,'whalepromobot' ,'joeparys' ,'peoplesbot' ,'votepower' ,'t50' ,'moneymatchgaming' ,'stef' ,
							'sureshot' ,'ptbot' ,'th3voter' ,'edensgarden' ,'oceanwhale' ,'botox' ,'whalecreator' ,'profitbot' ,'ecotrain' ,'automation' ,
							'siditech' ,'cabbage-dealer' ,'profitvote' ,'steemerap' ,'ubot' ,'dlivepromoter' ,'emperorofnaps' ,'proffit' ,'lrd' ,'bodzila' ,
							'peace-bot' ,'brandonfrye' ,'authors.league' ,'flymehigh' ,'noicebot' ,'redwhale' ,'lost-ninja' ,'dolphinbot' ,'rocky1' ,'estabond' ,
							'minnowvotes' ,'thebot' ,'booster' ,'slimwhale' ,'megabot' ,'singing.beauty' ,'estream.studios' ,'dailyupvotes' ,'ebargains' ,'promobot' ,
							'honestbot' ,'foxyd' ,'sunrawhale' ,'mitsuko' ,'onlyprofitbot' ,'spydo' ,'isotonic' ,'brupvoter' ,'postdoctor' ,'luckyvotes' ,
							'therising' ,'inciter' ,'redlambo' ,'shares' ,'nado.bot' ,'bid4joy' ,'voterunner' ,'steembloggers' ,'upmewhale' ,'mercurybot' ,
							'smartsteem' ,'postpromoter' ,'upme' ,'msp-bidbot' ,'aksdwi' ,'pushup' ,'appreciator' ,'sneaky-ninja' ,'lovejuice' ,'minnowhelper' ,
							'boomerang' ,'buildawhale')
) AS P
WHERE P.RowN = 1 AND P.SP > 0

/* 4. FOR CROSS CHECK : Current delegated SP to bidbots */

SELECT Account = name, Delegated_SP = CONVERT(FLOAT, LEFT(received_vesting_shares, CHARINDEX(' ', (received_vesting_shares))-1)) * 497.66528369215 / 1000000
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

/* 5. Number of accounts voted on */

SELECT COUNT(name)
FROM Accounts
WHERE CONVERT(CHAR(10), last_vote_time, 23) BETWEEN '2019-01-01' AND '2019-01-12'

/* 6. Monthly delegate account inflows, outflows, net flows */
/* outflux */

SELECT Month = DATEPART(mm,timestamp), Number_of_Unique_Delegator = COUNT(DISTINCT(delegator)), Total_delegated_SP = SUM(q.SP)
FROM (  
    SELECT delegator, delegatee, SP = vesting_shares * 497.66528369215 / 1000000, timestamp, ROW_NUMBER() OVER (PARTITION BY delegator ORDER BY timestamp DESC) AS RowN
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
WHERE CONVERT(CHAR(10), timestamp, 23) BETWEEN '2018-01-01' AND '2018-12-31' AND RowN = 1 AND SP = 0 
GROUP BY DATEPART(mm,timestamp)
ORDER BY DATEPART(mm,timestamp)