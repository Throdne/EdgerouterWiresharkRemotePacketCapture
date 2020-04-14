#!/bin/bash

# Author: Jerico Thomas
# Email: Support@TekOp.net
# Link: https://github.com/Throdne/EdgerouterWiresharkRemotePacketCapture

# init parameters
USER=""
SERVER=""
PORT="22"
ETH=""
FILTER=""

ERROR=0

# Get parameters 
while getopts u:s:p:i:f: option
    do
    case "${option}"
    in
    u) USER=${OPTARG};;
    s) SERVER=${OPTARG};;
    p) PORT=${OPTARG};;
    i) ETH=${OPTARG};;
    f) FILTER=${OPTARG};;
    esac
done

# Checks to see if parameters are set
if [ -z "$USER" ]; then
    echo "ERROR: Please provide a USERNAME for the SSH connect with -u"
    ERROR=1
fi

if [ -z "$SERVER" ]; then
    echo "ERROR: Please provide a SERVER for the SSH connect with -s"
    ERROR=1
fi

if [ -z "$PORT" ]; then
    echo "ERROR: Please provide a ssh PORT port to connect to server with -p"
    ERROR=1
fi

if [ -z "$ETH" ]; then
    echo "ERROR: Please provide an ETH port to monitor with -e"
    ERROR=1
fi

# Checks to see if ERROR was set to 1, if so terminates the script with error code 1
if [ "$ERROR" -eq 1 ]; then
    echo "Terminating..."
    exit 1
else
    echo "Starting Wireshark..."
    if [ ! -z "$FILTER" ]; then
        echo "Filter rules: $FILTER"
    fi
    wireshark -k -i <(ssh $USER@$SERVER -p $PORT /usr/sbin/tcpdump -i $ETH $FILTER -U -w - )
    exit 0
fi

# Did not exit properly 
exit 1