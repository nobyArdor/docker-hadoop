DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)
build:
	docker build -t 192.168.150.83\:15000/m8928/hadoop-base:$(current_branch) ./base
	docker build -t 192.168.150.83\:15000/m8928/hadoop-base-with-tez:$(current_branch) ./base_with_tez
	docker build -t 192.168.150.83\:15000/m8928/hadoop-namenode:$(current_branch) ./namenode
	docker build -t 192.168.150.83\:15000/m8928/hadoop-datanode:$(current_branch) ./datanode
	docker build -t 192.168.150.83\:15000/m8928/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t 192.168.150.83\:15000/m8928/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t 192.168.150.83\:15000/m8928/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t 192.168.150.83\:15000/m8928/hadoop-hiveserver:$(current_branch) ./hiveserver
push: 
        docker push 192.168.150.83\:15000/m8928/hadoop-base:$(current_branch)
        docker push 192.168.150.83\:15000/m8928/hadoop-base_with_tez:$(current_branch)
        docker push 192.168.150.83\:15000/m8928/hadoop-namenode:$(current_branch)
        docker push 192.168.150.83\:15000/m8928/hadoop-datanode:$(current_branch)
        docker push 192.168.150.83\:15000/m8928/hadoop-resourcemanager:$(current_branch)
        docker push 192.168.150.83\:15000/m8928/hadoop-nodemanager:$(current_branch)
        docker push 192.168.150.83\:15000/m8928/hadoop-historyserver:$(current_branch)
        docker push 192.168.150.83\:15000/m8928/hadoop-hiveserver:$(current_branch)
