#!/bin/bash

if [ -e "/opt/jc" ]; then
    echo "<result>Yes</result>"
else
    echo "<result>No</result>"
fi

exit 0