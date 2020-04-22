do shell script "pbpaste | /usr/local/bin/pandoc -f markdown -t html | /usr/bin/textutil -stdin -stdout -format html -convert rtf | pbcopy"
