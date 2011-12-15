#!/bin/bash

oddomain="/LDAPv3/od1-sdob.ad.barabooschools.net"
outfolder="~/Desktop/mcx_backup"
mkdir -p $outfolder"/computergroups"
mkdir -p $outfolder"/usergroups"

computers=`dscl $oddomain -list ComputerGroups`

for c in $computers
do
    outfile=$outfolder"/computergroups/$c.plist"
    echo $outfile
	dscl $oddomain -mcxexport /ComputerGroups/$c -o "$outfile"
done

users=`dscl $oddomain -list Groups`

for u in $users
do
    outfile=$outfolder"/usergroups/$u.plist"
    echo $outfile
	dscl $oddomain -mcxexport /Groups/$u -o "$outfile"
done

exit 0
