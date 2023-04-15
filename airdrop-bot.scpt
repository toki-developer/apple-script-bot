tell application "Brave Browser"
	tell window 1
		-- crew3 --
		set newTab to make new tab with properties {URL:"https://zealy.io/c/zetachain/questboard"}
		repeat while loading of active tab
			delay 0.2
		end repeat
		delay 3
		tell active tab
			execute javascript "document.getElementById('fa49700f-c3ed-40a0-96d7-f735a66f1bf9').click()"
			delay 3
			execute javascript "document.getElementsByClassName('chakra-button css-1xsvd1z')[0].click()"
		end tell
		set newTab2 to make new tab with properties {URL:"https://zealy.io/c/zkxprotocol/questboard"}
		repeat while loading of active tab
			delay 0.2
		end repeat
		delay 3
		tell active tab
			execute javascript "document.getElementById('d8b3632c-d487-4007-8bbb-4e87531532c1').click()"
			delay 3
			execute javascript "document.getElementsByClassName('chakra-button css-1xsvd1z')[0].click()"
		end tell
		-- crew 3 end --
	end tell
end tell