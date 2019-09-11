#!/bin/sh

return=$(sysctl cs.version)

if [ `echo $return | grep -c "unknown"` == 1 ]; then
    echo "<result>Not Installed</result>"
else
return=`echo $return | sed s/"cs.version: "//`
    echo "<result>$return</result>"
fi