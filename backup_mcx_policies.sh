#!/bin/bash

oddomain="/LDAPv3/od1-sdob.ad.barabooschools.net"

computers=`dscl $oddomain -list ComputerGroups`

for c in $computers
do
    outfile="~/Desktop/mcx_backup/$c.plist"
    echo $outfile
	dscl $oddomain -mcxexport /ComputerGroups/$c -o "$outfile"
done
