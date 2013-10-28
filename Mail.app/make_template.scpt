set curMonth to month of (current date) as number
set curDate to day of (current date) as number
set aSubject to "hoge" & curMonth & "月" & curDate & "日"
set theSender to "$sender"
set recipientAddr to "$commma_separated_to"
set bodyText to "

$body

"
 
makeMail(aSubject, theSender, recipientAddr, bodyText) of me
 
on makeMail(theSubject, theSender, recipientAddr, bodyText)
    tell application "Mail"
        set newMessage to make new outgoing message with properties {subject:theSubject, content:bodyText}
        tell newMessage
            set visible to true
            set sender to theSender
            make new to recipient at end of to recipients with properties {address:recipientAddr}
            makeAMessageToPlain() of me
        end tell
    end tell
end makeMail
on makeAMessageToPlain()
    activate application "Mail"
    tell application "System Events"
        tell process "Mail"
            set aTitle to title of menu item 11 of menu 1 of menu bar item 8 of menu bar 1
            if aTitle = "標準テキストにする" then
                click menu item 11 of menu 1 of menu bar item 8 of menu bar 1
            end if
        end tell
    end tell
end makeAMessageToPlain
