Run Container
http://10.129.135.238:8080/dockerStart.php?memory=500m&swap=2g&cpus=1&device-io=10mb&name=debo&port=80

Test Container
http://10.129.135.238/server.php?size=800&cpuLoad=200


httperf --client=0/1 --server=10.129.135.238 --port=80 --uri="/server.php?size=100&cpuLoad=350" --send-buffer=4096 --recv-buffer=16384 --num-conns=800 --rate=10


Stop contatiner
http://10.129.135.238:8080/dockerStop.php?name=debo

If container stops Running
service docker restart


Old test script

#!/bin/bash


i=1

SERVER="10.129.135.238"
PORT="80"
URI="/"

while [ $i -le 15 ]
do
	monitor_file="open-$i.log"

	tpid=$(ssh cs681@10.129.135.238 '
nohup vmstat 2 -n > '"$monitor_file"' 2>&1 < /dev/null &
pid=$!
echo $pid
')

	echo $tpid

	sleep 4

	echo "Running httperf for $i req/s" 
	httperf --server 10.129.135.238 --port 80 --uri /test.php --rate $i \
	--num-conn 800 --timeout 20 | tee -a test$i.txt
	sleep 5
	
	ssh cs681@10.129.135.238 "kill -9 $tpid"

	i=$(( $i + 1 ))
done