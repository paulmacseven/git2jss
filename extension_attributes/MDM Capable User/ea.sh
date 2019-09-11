#!/bin/bash

# EA to find the names of the MDM capable users on this device

# Set variables here
udid=$( ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { split($0, line, "\""); printf("%s\n", line[4]); }' )
jssurl=`/usr/bin/defaults read /Library/Preferences/com.jamfsoftware.jamf.plist jss_url`
apiuser="api_sb_hoth"
apipass="r9mZ1qUktsZh"

# Retrieve the computer record data from the JSS API.
# Use xpath to scope for the particular xml section we want. Dump all error to /dev/null because xpath doesn't output cleanly.
# sed to remove the xml tags leaving either the data we want, or nothing.
user=$( curl -k -H "Accept: application/xml" -s -u ${apiuser}:${apipass} ${jssurl}JSSResource/computers/udid/${udid} | xpath //general/mdm_capable_users 2> /dev/null | sed -e 's/<mdm_capable_users>//;s/<\/mdm_capable_users>//;s/<mdm_capable_users\/>//' )
# Report back as either a name or as unlisted
if [ "$user" = "" ];
then
        echo "<result>Missing</result>"
else
        echo "<result>$user</result>"
fi

# Finished!
exit 0