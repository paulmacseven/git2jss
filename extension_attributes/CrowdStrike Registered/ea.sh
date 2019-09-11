#!/bin/sh

return=$(sysctl cs.customerid)

if [ `echo $return | grep -c "0500697C-EE2F-411D-B4C9-C7408D853390"` == 1 ]; then
    echo "<result>Registered</result>"
else
return=`echo $return | sed s/"cs.customerid: "//`
    echo "<result>$return</result>"
fi