--------------------------
------utils---------------
--------------------------
global resultValue
set resultValue to "" & return

on setValue(paramKey, paramValue)
	global resultValue
	set resultValue to resultValue & paramKey & ": " & paramValue & return
end setValue
--------------------------
------crew3-------------
--------------------------
on clickCrew3DailyConnect(targetUrl, eleid)
	try
		tell application "Brave Browser"
			tell window 1
				-- タブを開く---
				set newTab to make new tab with properties {URL:targetUrl}
				repeat while loading of active tab
					delay 0.2
				end repeat
				---------------
				delay 3
				tell active tab
					-- 対象のクエストをクリック --
					repeat 5 times
						set targetElement to execute javascript "document.getElementById('" & eleid & "')"
						execute javascript "document.getElementById('" & eleid & "').click()"
						if targetElement = missing value then
							delay 1
						else
							exit repeat
						end if
					end repeat
					---------------------------------
					delay 3
					-- 報酬獲得ボタンのクリック---
					repeat with i from 0 to 5
						set elementText to execute javascript "document.getElementsByClassName('chakra-button css-1xsvd1z')[0].textContent"
						if elementText = missing value then
							delay 0.5
						else
							execute javascript "document.getElementsByClassName('chakra-button css-1xsvd1z')[0].click()"
							setValue(targetUrl, elementText & "Click DONE") of me
							exit repeat
						end if
						if (i = 5) then
							setValue(targetUrl, "Not Found ") of me
							exit repeat
						end if
					end repeat
					---------------------------------
				end tell
			end tell
		end tell
	on error
		setValue(targetUrl, "error") of me
	end try
end clickCrew3DailyConnect
--------------------------
------mobius------------
--------------------------

on mobiusTask()
	try
		tell application "Brave Browser"
			tell window 1
				-- タブを開く---
				set newTab to make new tab with properties {URL:"https://mobius.market/amm/airdrop/s2"}
				repeat while loading of active tab
					delay 0.2
				end repeat
				---------------
				delay 4
				tell active tab
					-- collect nowをクリック----
					repeat 5 times
						set collectNowElement to execute javascript "
							const btnElesForCollect = document.getElementsByTagName('button') ;
							const collectBtn = Array.from(btnElesForCollect).filter(e => e.textContent == ' Collect Now ')[0];
							collectBtn.click()
							collectBtn.textContent
						"
						if collectNowElement = missing value then
							delay 1
						else
							exit repeat
						end if
					end repeat
					---------------------------------
					delay 3
					-- Claimをクリック----
					repeat 5 times
						set claimElement to execute javascript "
							const btnElesForClaim = document.getElementsByTagName('button') ;
							const claimBtn = Array.from(btnElesForClaim).filter(e => e.textContent == ' Claim ')[0];
							claimBtn.click()
							claimBtn.textContent
						"
						if claimElement = missing value then
							delay 1
						else
							setValue("mobius", "Claim Click Done") of me
							exit repeat
						end if
					end repeat
					---------------------------------
					delay 3
					-- Share Nowをクリック----
					---------------------------------
				end tell
			end tell
		end tell
	on error
		setValue("mobius", "error") of me
	end try
end mobiusTask
--------------------------
------starBlock------------
--------------------------

on starBlockTask()
	try
		tell application "Brave Browser"
			tell window 1
				-- タブを開く---
				set newTab to make new tab with properties {URL:"https://starblock.io/airdrop"}
				repeat while loading of active tab
					delay 0.2
				end repeat
				---------------
				delay 4
				tell active tab
					-- Spreadタブをクリック----
					repeat 5 times
						set spreadTabElement to execute javascript "
							const tabItemElementList = document.getElementsByClassName('tab-control-item-text') ;
							const spreadTab = Array.from(tabItemElementList).filter(e => e.textContent == 'Spread')[0];
							spreadTab.click()
							spreadTab.textContent
						"
						if spreadTabElement = missing value then
							delay 1
						else
							exit repeat
						end if
					end repeat
					---------------------------------
					delay 3
					-- Spreadボタンをクリック----
					repeat 5 times
						set spreadButtonElement to execute javascript "
							const btnElesForSpread = document.querySelectorAll('.yellow_button a');
							const spreadBtn = Array.from(btnElesForSpread).filter(e => e.textContent == ' Spread ')[0];
							spreadBtn.click()
							spreadBtn.textContent
						"
						if spreadButtonElement = missing value then
							delay 1
						else
							setValue("starBlock", "Spread Click Done") of me
							exit repeat
						end if
					end repeat
				end tell
			end tell
		end tell
	on error
		setValue("starBlock", "error") of me
	end try
end starBlockTask


--------------------------
------main---------------
--------------------------
setValue("crew3", "daily connect")
clickCrew3DailyConnect("https://zealy.io/c/zetachain/questboard", "fa49700f-c3ed-40a0-96d7-f735a66f1bf9")
clickCrew3DailyConnect("https://zealy.io/c/zkxprotocol/questboard", "d8b3632c-d487-4007-8bbb-4e87531532c1")
clickCrew3DailyConnect("https://zealy.io/c/suiswap-app/questboard", "e3073a79-0ebc-465c-9e2c-7f4eeecebb0b")
clickCrew3DailyConnect("https://zealy.io/c/suiswap-app/questboard", "c4fb82be-d091-45b4-b4d8-bb3915563b57")
clickCrew3DailyConnect("https://zealy.io/c/rabbitx/questboard", "818a19cf-bf96-4810-b0bf-ed99c41e9c76")
clickCrew3DailyConnect("https://zealy.io/c/fewcha/questboard", "9b06676b-32db-46b5-9d3f-50146afb9cc2")
clickCrew3DailyConnect("https://zealy.io/c/snsdomains/questboard", "a67c3762-9c2b-4530-8381-bba2e9270bf0")

setValue("crew3", "weekly connect")
clickCrew3DailyConnect("https://zealy.io/c/suiswap-app/questboard", "1d9824e7-b2d9-4235-839d-20f7f7aa282a")
clickCrew3DailyConnect("https://zealy.io/c/suiswap-app/questboard", "9df2617f-fcb2-4c0b-87bb-c24edeeb7697")
clickCrew3DailyConnect("https://zealy.io/c/rabbitx/questboard", "17357b08-c232-4542-8308-527a8aa09090")

setValue("mobius", "")
mobiusTask()

setValue("starblock", "")
starBlockTask()

return resultValue