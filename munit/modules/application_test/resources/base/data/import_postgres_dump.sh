#!/bin/bash
dumpfile=$1
sshhost=$2
sshuser=$3
sshkey=$4
pgcontainer=$5
pguser=$6
pgpwd=$7
pgdb=$8
cat ${dumpfile} | ssh ${sshuser}@${sshhost} -o "StrictHostKeyChecking=no" -o "IdentitiesOnly=yes" -i ${sshkey} "docker exec -e PGPASSWORD=${pgpwd} -i ${pgcontainer} psql -U ${pguser} -d ${pgdb}"