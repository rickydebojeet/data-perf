# data-perf

Use Machine Learining to predict the performance of a container.
We need to collect data to train the models.

Setup the server then run the client to collect data.

- To run the container:

```Console
curl http://<ip>:8080/dockerStart.php?memory=<memory-size>m&swap=<swap-size>g&cpus=<cpu>&device-io=<io-rate>mb&name=<container-name>&port=<port>
```

- Test Container:

```Console
curl http://<ip>/server.php?size=<io-size>&cpuLoad=<cpu-load>
```

- Stop contatiner:

```Console
curl http://<ip>:8080/dockerStop.php?name=<container-name>
```

- For load testing using httperf:

```Console
httperf --client=0/1 --server=<ip> --port=<port> --uri="/server.php?size=<io-size>&cpuLoad=<cpu-load>" --send-buffer=4096 --recv-buffer=16384 --num-conns=<number-of-connections> --rate=<rate>
```

> Note: Use the modified httperf from [this](https://github.com/sam990/httperf) repo.
