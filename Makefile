DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := 2.0.0-hadoop3.3.3-java8
build:
	docker build -t bde2020/hadoop-base:$(current_branch) ./base
	docker build -t bde2020/hadoop-namenode:$(current_branch) ./namenode
	docker build -t bde2020/hadoop-datanode:$(current_branch) ./datanode
	docker build -t bde2020/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t bde2020/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t bde2020/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t bde2020/hadoop-submit:$(current_branch) ./submit

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r -f /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r -f /input
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-3.3.3/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r -f /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r -f /input
bash:
	docker run -it -v /home/noby.ardor/hadoop:/hadoop/user_conf --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) bash

wordcountpy:
	docker build -t hadoop-wordcountpy ./mapper_py
	docker run -v /home/noby.ardor/hadoop/docker-hadoop/mapper_py:/data --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcountpy
bashpy:
	docker build -t hadoop-wordcountpy ./mapper_py
	docker run -it -v /home/noby.ardor/hadoop/docker-hadoop/mapper_py:/data --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcountpy bash

bash_zep:
	docker run --rm -it --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/zeppelin:0.10.1 /bin/bash

