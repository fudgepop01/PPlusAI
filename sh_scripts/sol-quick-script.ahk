#Requires AutoHotkey v2.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SCROLL DOWN TO WHERE THE OPTIONS ARE, THIS IS A SECTION FOR DEFINING THINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Design_Black_Bird := 0
Design_Space_Shuttle := 1
Design_Stealth_Bomber := 2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CHANGE THESE VALUES TO THE OPTIONS YOU LIKE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; best ways to contact you (True means contact me here, False means do not)
Contact_Email := True
Contact_Telegram := False
Contact_Discord := True

; username/address that can be sent a message
Contact_UserAddr_Message := "Hello World"

; links to reference images
Reference_Image_Links := "
(
  Image1: url
  Image2: url
  Image3: url
  etc
)"

; color design (remove the ; from the one that you want) 
; Chosen_Design := Design_Black_Bird
; Chosen_Design := Design_Space_Shuttle
Chosen_Design := Design_Stealth_Bomber

; what expression? (For "no preference" or "Artistic Liberty" leave this blank)
Desired_Expression := ""

; name for the badge
Badge_Name := ""

; character species
Character_Species := "Wulfen"

; pronouns if desired
Pronouns := "She/Her" ; this is just an assumption idk

; paypal email address
Paypal_Email := "your-email-here"

; twitter and/or bluesky
Social_Links := "
(
  Bluesky: 
  Twitter: @WulfenSol
)"

; within the US?
Within_USA := True

; package name
Package_Name := "Your Real Name Here"

; address
Street_Address := "Street Address Line 1"
Street_AddressLn2 := "Street Address Line 2"
City := "City Here"
State_or_Province := "State/Province Here"
Zip := "Zip Here"
Country := "Country Here"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THIS IS THE THING RESPONSIBLE FOR RUNNING THE SCRIPT ITSELF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^+z::
{
  old_clip := ClipboardAll()
  Sleep 50
  
  Loop 4 {
    Send "`t"
    Sleep 50
  }

  if (Contact_Email = True) { 
    Send " "
    Sleep 50
  }
  Send "`t"
  Sleep 50
  if (Contact_Telegram = True) { 
    Send " "
    Sleep 50
  }
  Send "`t"
  Sleep 50
  if (Contact_Discord = True) { 
    Send " "
    Sleep 50
  }
  Send "`t"
  Sleep 50

  A_Clipboard := Contact_UserAddr_Message
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Reference_Image_Links
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  Loop Chosen_Design {
    Send "{Right}"
    Sleep 50
  }
  Send "`t"
  Sleep 50

  A_Clipboard := Desired_Expression
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Badge_Name
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Character_Species
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Pronouns
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Paypal_Email
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Social_Links
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  ; are within the US
  if (Within_USA = False) {
    Send "`t"
  } else {
    Send " "
    Sleep 50
    Send "`t"
  }

  A_Clipboard := Package_Name
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Street_Address
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Street_AddressLn2
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := City
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := State_or_Province
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Zip
  Send "^v"
  Sleep 50
  Send "`t"
  Sleep 50

  A_Clipboard := Country
  Send "^v"
  Sleep 50

  A_Clipboard := old_clip
}