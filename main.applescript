display dialog "Welcome To Email Spammer 2.5 
Please allow all permissions to use this app
Happy Spamming!" default button 1 with title "Email Spammer 2.5"

set theSender to text returned of (display dialog "What's your email eg. email@example.com 
I am asking this question becuase some people might have two accounts linked to their mail app" default answer "")

set recipientAddress to text returned of (display dialog "What's the email address of the person you want to spam? eg. goelishan2005@gmail.com" default answer "")

set Subject to text returned of (display dialog "What's the subject of the spam email? eg. This is what I want the subject to be! It can be anything I want it to beeee🤪!" default answer "")

set theContent to text returned of (display dialog "What's the content of the spam email? eg. This is what i want the content to be! It can be anything I want it to beeee🤪!" default answer "")
set button_returned to button returned of (display dialog "Do you want to attach a file?" buttons {"Yes", "No"} default button 2)

if button_returned is "Yes" then
	set theAttachmentFile to choose file with prompt "Please select a file to attach:"
end if

set progress description to "Spam Progress"


set i to 0
set int to text returned of (display dialog "Set how fast the mail goes. Recommended - 3, Slow - 5, Fast - 1" default answer "3")
set numoftimes to text returned of (display dialog "Number of messages to send" default answer "50" buttons {"Cancel", "Finish and send my spam!"})
set progress total steps to numoftimes

repeat numoftimes times
	set theSubject to " "
	set i to i + 1
	set s to i as string
	set theSubject to Subject & " " & s
	
	
	tell application "Mail"
		
		--Create the message
		set theMessage to make new outgoing message with properties {sender:theSender, subject:theSubject, content:theContent, visible:false}
		
		--Set a recipient
		tell theMessage
			make new to recipient with properties {address:recipientAddress}
			if button_returned is "Yes" then
				make new attachment with properties {file name:theAttachmentFile as alias}
			end if
			
			delay int
			send
			
		end tell
	end tell
	
	set progress completed steps to i
end repeat
display notification "Spamming Done!" sound name "default"
delay 3
