#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetWorkingDir % A_ScriptDir


;Ctrl + Alt + V
^!v:: 
    ;memorize window and mouse position
    ;MouseGetPos, xPos, yPos

    ; Get the unique ID, title, and process name of the current window
    WinGet, currentID, ID, A
    WinGetTitle, currentTitle, A
    WinGet, currentProcess, ProcessName, A

    ; Save the current clipboard content to a file
    FileDelete, input.html
    FileEncoding, UTF-8
    FileAppend, %Clipboard%, input.html

    ; Run the XSLT transformation
    ;RunWait, java -jar "saxon-9.1.0.8.jar" -s:input.html -xsl:transformation.xsl -o:output.html

    ;RunWait, msxsl.exe -u '3.0' input.html transformation.xsl -o output.html

    ;BEST Working
    ;make xhtml file that will comply with Saxon reqs
    RunWait, java -jar tagsoup-1.2.1.jar --encoding=utf8 --html --method=html --nons --nobogons --nodefaults --omit-xml-declaration --output-encoding=utf8 --files input.html,, Hide

    ;Run Saxon processor to do main logic
    RunWait, java -cp Saxon-HE-10.6.jar;tagsoup-1.2.1.jar net.sf.saxon.Transform -x:org.ccil.cowan.tagsoup.Parser -s:input.xhtml -xsl:transformation.xsl -o:output.html,, Hide

    ;Run Saxon processor to do main logic
    RunWait, java -cp .;jsoup-1.14.3.jar pretty_print_html,, Hide

    ; Load the transformed content back into the clipboard
    FileRead, OutputContent, output_pretty.html
    Clipboard := OutputContent

    ; Activate the window with the previously obtained unique ID
    WinActivate, ahk_id %currentID%

    ; Emulate left mouse button click
    ;MouseClick, left, %xPos%, %yPos%

    ; Paste the transformed content
    Send ^v
return



