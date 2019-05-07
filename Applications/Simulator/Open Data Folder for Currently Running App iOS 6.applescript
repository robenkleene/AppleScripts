do shell script "open \"`ps ax | grep -oE \"/.*Library/Application\\sSupport/iPhone\\sSimulator/[^/]*/Applications/[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}/\" | head -n 1`\""

