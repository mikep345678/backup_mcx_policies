#!/bin/bash

oddomain="/LDAPv3/od1-sdob.ad.barabooschools.net"

computers=`dscl $oddomain -list ComputerGroups`

for c in $computers
do
    outfile="~/Desktop/mcx_backup/computergroups/$c.plist"
    echo $outfile
	dscl $oddomain -mcxexport /ComputerGroups/$c -o "$outfile"
done

users=`dscl $oddomain -list Groups`

for u in $users
do
    outfile="~/Desktop/mcx_backup/usersgroups/$u.plist"
    echo $outfile
	dscl $oddomain -mcxexport /Groups/$u -o "$outfile"
done

exit 0
