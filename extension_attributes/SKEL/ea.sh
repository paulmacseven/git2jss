#!/bin/bash

#Get OS minor version
osvers_minor=$(/usr/bin/sw_vers -productVersion | /usr/bin/awk -F. '{print $2}')

#Check if 10.13 or above - anything lower doesn't need UAKEL
if [[ ${osvers_minor} -ge 13 ]]; then
	SKEL=$(/usr/bin/sqlite3 /var/db/SystemPolicyConfiguration/KextPolicy "SELECT * FROM kext_policy;")
    echo "<result>$SKEL</result>"
else
	echo "<result>OS Too low</result>"
fi