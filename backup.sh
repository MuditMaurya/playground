#!/bin/bash
#************************************************#
#                  backup.sh                     #
#           written by Mriyam Tamuli             #
#                July 17, 2016                   #
#                                                #
#         Back up data to external HDD.          #
#************************************************#

LOGFILE=backup.log
ERRORFILE=backup.err

RCol='\e[0m'    # Text Reset
Blu='\e[0;34m'
Gre='\e[0;32m'
Yel='\e[0;33m'
BBla='\e[1;30m'
URed='\e[4;31m'
On_Whi='\e[47m'

COPY_PROG='rsync'
RSYNC_FLAGS='azv'

#################################################################################
#                                                                               #
#                           MAIN SCRIPT STARTS HERE                             #
#                                                                               #
#################################################################################

clear
echo -e "[${Blu}ACTION${RCol}]  Starting script"
echo -e "[${Blu}NOTICE${RCol}]  Hello, $USER."
echo -e -n "[${Blu}NOTICE${RCol}]  Enter the path of the external HDD and press [ENTER]: "
read backup_drive


#source_array = [a,b,c]
#destination_array = [a,b,c]
#for i in source_array;
#do
#    $COPY_PROG -$RSYNC_FLAGS source_array[i] destination_array[i] >>$LOGFILE 2>>$ERRORFILE
#done


echo -e "[${Gre}NOTICE${RCol}]  Backing up Documents."
$COPY_PROG -$RSYNC_FLAGS $HOME/Documents/* $backup_drive/Backup/Documents/ >>$LOGFILE 2>>$ERRORFILE
echo -e "[${Gre}NOTICE${RCol}]  Backing up Downloads."
$COPY_PROG -$RSYNC_FLAGS $HOME/Downloads/* $backup_drive/Backup/Downloads/ >>$LOGFILE 2>>$ERRORFILE
echo -e "[${Gre}NOTICE${RCol}]  Backing up Entertaintment."
$COPY_PROG -$RSYNC_FLAGS $HOME/Entertaintment/* $backup_drive/Backup/Entertaintment/ >>$LOGFILE 2>>$ERRORFILE
echo -e "[${Gre}NOTICE${RCol}]  Backing up Pictures."
$COPY_PROG -$RSYNC_FLAGS $HOME/Pictures/* $backup_drive/Backup/Pictures/ >>$LOGFILE 2>>$ERRORFILE
echo -e "[${Gre}NOTICE${RCol}]  Backing up Music."
$COPY_PROG -$RSYNC_FLAGS $HOME/Music/* $backup_drive/Backup/Music/ >>$LOGFILE 2>>$ERRORFILE
echo -e "[${Gre}NOTICE${RCol}]  Backing up TVSeries."
$COPY_PROG -$RSYNC_FLAGS $HOME/Videos/TVSeries/* $backup_drive/Backup/Videos/TVSeries/ >>$LOGFILE 2>>$ERRORFILE
echo -e "[${Gre}NOTICE${RCol}]  Backing up Movies."
$COPY_PROG -$RSYNC_FLAGS $HOME/Videos/Movies/* $backup_drive/Backup/Videos/Movies/ >>$LOGFILE 2>>$ERRORFILE
echo -e "[${Gre}NOTICE${RCol}]  Backing up workspace."
$COPY_PROG -$RSYNC_FLAGS $HOME/workspace/* $backup_drive/Backup/workspace/ >>$LOGFILE 2>>$ERRORFILE

echo
echo
echo -e "[${Gre}NOTICE${RCol}]  ${BBla}${On_Whi}Backup Complete${RCol}."
echo
echo
