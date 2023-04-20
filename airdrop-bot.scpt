--------------------------
------utils---------------
--------------------------
global resultValue
set resultValue to "" & return

on setValue(paramKey, paramValue)
	global resultValue
	set resultValue to resultValue & paramKey & ": " & paramValue & return
end setValue

on clickOneItem(titleName, targetURL, clickJsCode)
	try
		tell application "Brave Browser"
			tell window 1
				-- タブを開く---
				set newTab to make new tab with properties {URL:targetURL}
				repeat while loading of active tab
					delay 0.2
				end repeat
				---------------
				delay 4
				tell active tab
					-- ボタンをクリック----
					repeat with i from 0 to 5
						set eleText to execute javascript clickJsCode
						if eleText = missing value then
							delay 1
						else
							setValue(titleName, "Click Done") of me
							exit repeat
						end if
						if (i = 5) then
							setValue(titleName, "Not Found ") of me
							exit repeat
						end if
					end repeat
					---------------------------------
				end tell
			end tell
		end tell
	on error
		setValue(titleName, "error") of me
	end try
end clickOneItem

on clickTwoItem(titleName, targetURL, clickJsCode, clickJsCode2)
	try
		tell application "Brave Browser"
			tell window 1
				-- タブを開く---
				set newTab to make new tab with properties {URL:targetURL}
				repeat while loading of active tab
					delay 0.2
				end repeat
				---------------
				delay 4
				tell active tab
					-- 1つ目のボタンをクリック----
					set flag to false
					repeat with i from 0 to 5
						set eleText to execute javascript clickJsCode
						if eleText = missing value then
							delay 1
						else
							exit repeat
						end if
						if (i = 5) then
							setValue(title, "Not Found (1)") of me
							set flag to true
							exit repeat
						end if
					end repeat
					delay 3
					-- 2つ目のボタンをクリック----
					repeat with i from 0 to 5
						if flag then
							exit repeat
						end if
						set eleText to execute javascript clickJsCode2
						if eleText = missing value then
							delay 1
						else
							setValue(titleName, "Click Done") of me
							exit repeat
						end if
						if (i = 5) then
							setValue(titleName, "Not Found (2)") of me
							exit repeat
						end if
					end repeat
				end tell
			end tell
		end tell
	on error
		setValue(titleName, "error") of me
	end try
end clickTwoItem

--------------------------
------crew3-------------
--------------------------
on clickCrew3Connect(titleName, eleid)
	clickTwoItem("crew3-" & titleName, "https://zealy.io/c/" & titleName & "/questboard", "
							const targetQuest = document.getElementById('" & eleid & "');
							targetQuest.click()
							targetQuest.textContent
						", "
							const claimBtn = document.getElementsByClassName('chakra-button css-1xsvd1z')[0] ;
							claimBtn.click()
							claimBtn.textContent
						") of me

end clickCrew3Connect

on crew3Task()
	setValue("crew3", "daily connect") of me
	clickCrew3Connect("zetachain", "fa49700f-c3ed-40a0-96d7-f735a66f1bf9")
	clickCrew3Connect("zkxprotocol", "d8b3632c-d487-4007-8bbb-4e87531532c1")
	clickCrew3Connect("suiswap-app", "e3073a79-0ebc-465c-9e2c-7f4eeecebb0b")
	clickCrew3Connect("suiswap-app", "c4fb82be-d091-45b4-b4d8-bb3915563b57")
	clickCrew3Connect("rabbitx", "818a19cf-bf96-4810-b0bf-ed99c41e9c76")
	clickCrew3Connect("fewcha", "9b06676b-32db-46b5-9d3f-50146afb9cc2")
	clickCrew3Connect("snsdomains", "a67c3762-9c2b-4530-8381-bba2e9270bf0")
	clickCrew3Connect("suipadxyz", "0de7abfa-c920-4c10-9925-b386b68f88b0")

	setValue("crew3", "weekly connect") of me
	clickCrew3Connect("suiswap-app", "1d9824e7-b2d9-4235-839d-20f7f7aa282a")
	clickCrew3Connect("suiswap-app", "9df2617f-fcb2-4c0b-87bb-c24edeeb7697")
	clickCrew3Connect("rabbitx", "17357b08-c232-4542-8308-527a8aa09090")
	clickCrew3Connect("suipadxyz", "602fa1ba-1255-47ca-b099-8d38a1102428")
end crew3Task

--------------------------
------mobius------------
--------------------------
on mobiusTask()
	setValue("mobius", "") of me
	clickTwoItem("mobius", "https://mobius.market/amm/airdrop/s2", "
							const btnElesForCollect = document.getElementsByTagName('button') ;
							const collectBtn = Array.from(btnElesForCollect).filter(e => e.textContent == ' Collect Now ')[0];
							collectBtn.click()
							collectBtn.textContent
						", "
							const btnElesForClaim = document.getElementsByTagName('button') ;
							const claimBtn = Array.from(btnElesForClaim).filter(e => e.textContent == ' Claim ')[0];
							claimBtn.click()
							claimBtn.textContent
						") of me
end mobiusTask
--------------------------
------starBlock----------
--------------------------
on starBlockTask()
	setValue("starblock", "") of me
	clickTwoItem("starBlock", "https://starblock.io/airdrop", "
							const tabItemElementList = document.getElementsByClassName('tab-control-item-text') ;
							const spreadTab = Array.from(tabItemElementList).filter(e => e.textContent == 'Spread')[0];
							spreadTab.click()
							spreadTab.textContent
						", "
							const btnElesForSpread = document.querySelectorAll('.yellow_button a');
							const spreadBtn = Array.from(btnElesForSpread).filter(e => e.textContent == ' Spread ')[0];
							spreadBtn.click()
							spreadBtn.textContent
						") of me
end starBlockTask

--------------------------
------layer3-------------
--------------------------
on layer3Task()
	setValue("layer3", "") of me
	clickOneItem("layer3", "https://layer3.xyz/quests", "
							const buttonElementList = document.getElementsByTagName('button');
							const gmButton = Array.from(buttonElementList).filter(e => e.textContent == 'gm')[0];
							gmButton.click()
							gmButton.textContent
						") of me
end layer3Task
--------------------------
------Magic Eden--------
--------------------------
on magicEdenTask()
	setValue("Magic Eden", "") of me
	clickOneItem("Magic Eden", "https://magiceden.io/settings/rewards", "
							const textElesForClaim = document.getElementsByTagName('p');
							const claimText = Array.from(textElesForClaim).filter(e => e.textContent == 'Claim')[0];
							claimText.click()
							claimText.textContent
						") of me
end magicEdenTask
--------------------------
------main---------------
--------------------------
crew3Task()
mobiusTask()
starBlockTask()
layer3Task()
magicEdenTask()

return resultValue