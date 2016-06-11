; Download and install Autohotkey from  http://autohotkey.com/
; Download or copy/paste this script to scraper.ahk
; Run it (just double klick scraper.ahk)

; F3 - Bottle Filling. Place mouse pointer over bottles you want to fill and press F3 to start (Esc or F8 to stop)
; F4 - Ammo Dismanteling. Place mouse pointer over ammo you want to dismantle and press F4 to start (Esc or F8 to stop)
; F5 - Auto scraping if you have crowbars in all 3 slots - automaticaly switches wearing crobars for legitimate scraping
; F6 - Auto crowbar glitching - crowbar in slot 1. Just stand next to a wreck and press F6 to start (Esc or F8 to stop) 
; F7 - Legitimate scraping, just regular autoclicking with one crowbar.

; F8 or Esc - stops all above

#SingleInstance
#IfWinActive H1Z1
#MaxThreadsPerHotkey 2

sleepDelayScraping := 150
crowbarSwitchingFactor := 5
sleepDelayFill := 5500
sleepDelayDismanteling := 2000

toggle := 0

~*F3::
	toggle := 1
	While toggle{
		SetMouseDelay 30
		Click right 
		MouseMove, 10, 10, 3, R
		Click
		MouseMove, -10, -10, 3, R
		Sleep sleepDelayFill
	}
Return

~*F4::
	toggle := 1
	While toggle{
		SetMouseDelay 30
		Click right 
		MouseMove, 10, 10, 3, R
		Click
		MouseMove, -10, -10, 3, R
		Sleep sleepDelayDismanteling
	}
Return

~*F5::
	toggle := 1
	While toggle{
		Random, rand, 1, crowbarSwitchingFactor
		if (rand = 1) {
			Send 2
			Sleep 50
		}
		SetMouseDelay 30
		Click
		Sleep sleepDelayScraping
	}
Return

~*F6::
	toggle := 1
	Send 1
	Sleep 1000
	Send x
	Sleep 50
	Send 2
	Sleep 1000
	Send x
	Sleep 250
	While toggle{
		SetMouseDelay 30
		Click
		Sleep sleepDelayScraping
	}
Return

~*F7::
	toggle := 1
	While toggle{
		SetMouseDelay 30
		Click
		Sleep sleepDelayScraping
	}
Return

~*F8::
	toggle := 0
Return

~*Esc::
	toggle := 0
Return
