-- This version asks to delete auto-recovery information
-- tell application "BBEdit"
-- activate
-- make new text document with properties {contents:current clipboard}
-- end tell

set theCommand to "/usr/local/bin/bbedit"
do shell script "pbpaste | " & theCommand

