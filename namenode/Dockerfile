FROM 192.168.150.83:15000/m8928/hadoop-base-with-tez:3.3.3-java8

HEALTHCHECK --interval=30s --timeout=10s --start-period=5m CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870

CMD ["/run.sh"]
