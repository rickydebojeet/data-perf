#!/bin/bash

ip="10.129.131.147"

echo "deviceIORate,cpu,memory,conns,arrivalRate,ioLoad,cpuLoad,responseTime" >> sam_new_loadtest.csv

for device_io in "50mb"
do
    for cpu in 1
    do
        for mem in '800m'
        do 
            for conns in 25
            do
                for rate in 5
                do
                    for io in {140..200..20};
                    do
                        for cpuLoad in 350 400 450 500
                        do
                            curl -X GET "${ip}:8080/dockerStart.php?memory=${mem}&cpus=${cpu}&device-io=${device_io}&swap=2g&name=test1&port=80"
                            httperf --server=${ip} --port=80 --uri="/server.php?size=${io}&cpuLoad=${cpuLoad}" --send-buffer=4096 --recv-buffer=16384 --num-conns=${conns} --rate=${rate} > result.txt
                            awk -v var0="$device_io" -v var1="$cpu" -v var2="$mem" -v var3="$conns" -v var4="$rate" -v var5="$io" -v var6="$cpuLoad" '{OFS=","; if ($1 == "Reply" && $2 == "time") r1 = $5;} END{print var0,var1,var2,var3,var4,var5,var6,r1}' result.txt >> sam_new_loadtest.csv
                            sleep 10
                            curl -X GET "${ip}:8080/dockerStop.php?name=test1"

                            echo "Done with CPU Load:$cpuLoad IO Size:$io Rate:$rate Mem:$mem CPU:$cpu IO:$device_io Swap:on"
                        done
                    done
                done
            done                
        done	
    done
done


for device_io in "50mb"
do
    for cpu in 1
    do
        for mem in '800m'
        do 
            for conns in 25
            do
                for rate in {6..20..1};
                do
                    for io in {0..200..20};
                    do
                        for cpuLoad in 350 400 450 500
                        do
                            curl -X GET "${ip}:8080/dockerStart.php?memory=${mem}&cpus=${cpu}&device-io=${device_io}&swap=2g&name=test1&port=80"
                            httperf --server=${ip} --port=80 --uri="/server.php?size=${io}&cpuLoad=${cpuLoad}" --send-buffer=4096 --recv-buffer=16384 --num-conns=${conns} --rate=${rate} > result.txt
                            awk -v var0="$device_io" -v var1="$cpu" -v var2="$mem" -v var3="$conns" -v var4="$rate" -v var5="$io" -v var6="$cpuLoad" '{OFS=","; if ($1 == "Reply" && $2 == "time") r1 = $5;} END{print var0,var1,var2,var3,var4,var5,var6,r1}' result.txt >> sam_new_loadtest.csv
                            sleep 10
                            curl -X GET "${ip}:8080/dockerStop.php?name=test1"

                            echo "Done with CPU Load:$cpuLoad IO Size:$io Rate:$rate Mem:$mem CPU:$cpu IO:$device_io Swap:on"
                        done
                    done
                done
            done                
        done	
    done
done

for device_io in "50mb"
do
    for cpu in 1
    do
        for mem in '800m'
        do 
            for conns in {50..100..25}
            do
                for rate in {1..20..1};
                do
                    for io in {0..200..20};
                    do
                        for cpuLoad in 350 400 450 500
                        do
                            curl -X GET "${ip}:8080/dockerStart.php?memory=${mem}&cpus=${cpu}&device-io=${device_io}&swap=2g&name=test1&port=80"
                            httperf --server=${ip} --port=80 --uri="/server.php?size=${io}&cpuLoad=${cpuLoad}" --send-buffer=4096 --recv-buffer=16384 --num-conns=${conns} --rate=${rate} > result.txt
                            awk -v var0="$device_io" -v var1="$cpu" -v var2="$mem" -v var3="$conns" -v var4="$rate" -v var5="$io" -v var6="$cpuLoad" '{OFS=","; if ($1 == "Reply" && $2 == "time") r1 = $5;} END{print var0,var1,var2,var3,var4,var5,var6,r1}' result.txt >> sam_new_loadtest.csv
                            sleep 10
                            curl -X GET "${ip}:8080/dockerStop.php?name=test1"

                            echo "Done with CPU Load:$cpuLoad IO Size:$io Rate:$rate Mem:$mem CPU:$cpu IO:$device_io Swap:on"
                        done
                    done
                done
            done                
        done	
    done
done