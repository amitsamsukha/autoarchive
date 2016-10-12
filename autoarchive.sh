#!/bin/bash
####################################
#
# Backup script
# @Author: Amit
#
####################################

# What to backup
backup_source="/var/www/"

# Where to backup
backup_dest="/backup/"

# Archive 
archive_dest="/var/autobackup/auto_archive/"

# Create archive filename.
day=$(date +%F)
echo $day
#create an archive folder for the day
mkdir -p $archive_dest$day

cd $backup_source

#Loop
for D in `find . -maxdepth 1 -type d -mtime +30`
do
#       echo "checking directory $D"
        if [ `find $D -maxdepth 2 -type d -mtime -30 |wc -l` -gt 0 ]
        then
#               echo "working directory :: Skip $D"     
                echo ""
        else
                echo "NOT working directory :: Moving $D to $archive_dest$day"  
#                       echo "  mv $D $archive_dest$day"
                `mv $D $archive_dest$day`
        fi
done
