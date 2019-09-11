#!/bin/bash
# Get list of users with local admin rights and return as an Extension Attribute

# Query Group
useradmins=$(dscl . -read /Groups/admin GroupMembership  | sed "s/GroupMembership: //")

if [ $useradmins == "" ]; then
	echo "<result>No local admins</result>"
else
	echo "<result>$useradmins</result>"
fi