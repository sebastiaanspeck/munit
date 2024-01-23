@ECHO on
set dumpfile=%1
set sshhost=%2
set sshuser=%3
set sshkey=%4
set pgcontainer=%5
set pguser=%6
set pgpwd=%7
set pgdb=%8
type %dumpfile% | ssh %sshuser%@%sshhost% -o "StrictHostKeyChecking=no" -o "IdentitiesOnly=yes" -i %sshkey% "docker exec -e PGPASSWORD=%pgpwd% -i %pgcontainer% psql -U %pguser% -d %pgdb%"