#!/bin/bash
ls
echo 1
(
exec ./restore.sh
)
wait $!
echo hiii
sleep 1
poweroff
