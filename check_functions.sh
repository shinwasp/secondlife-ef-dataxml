#!/bin/bash
#
#   Secondlife functions checker
#   Copyright (C) 2012 Shin Wasp <https://my.secondlife.com/shin.wasp> 
#    
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public
#   License as published by the Free Software Foundation; either
#   version 2.1 of the License, or (at your option) any later version.
#
#   This library is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public
#   License along with this library; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
# ---------------------------------------------------------------------------
#

srcdir=$1
lscript_file="indra/lscript/lscript_library/lscript_library.cpp"

filename=$srcdir/$lscript_file

if [[ "x$1" = "x" ]];then
	echo "please specify secondlife sourcecode directory."
	exit 10
elif [[ ! -e $filename ]];then
	echo "cannot find \"indra/lscript/lscript_library/lscript_library.cpp\" file under giving dir"
	exit 11
fi

for f in `grep "addFunction" $filename | cut -d\" -f2`;do
	if [[ "${f:0:2}" = "ll" ]];then
		echo -n "Testing $f ... "
		grep "$f" "Data.xml" > /dev/null
		if [ "$?" -eq 1 ];then
			echo -e "\e[00;31mMissing!!\e[00m"
		else
			echo "exist."
		fi
	fi
done

# ex: set tabstop=4:
