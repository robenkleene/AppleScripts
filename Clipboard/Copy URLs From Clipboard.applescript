set theCommand to "~/.bin/urls"
set theResult to do shell script "pbpaste | " & theCommand
set the clipboard to theResult
