FROM bde2020/hadoop-base:2.0.0-hadoop3.3.3-hive3.1.3-java8

ENV TEZ_VERSION 0.10.1

RUN curl -fSL https://dlcdn.apache.org/tez/${TEZ_VERSION}/apache-tez-${TEZ_VERSION}-bin.tar.gz  \
    -o ./tez-${TEZ_VERSION}-bin.tar.gz

RUN mkdir /opt/tez-${TEZ_VERSION}
RUN tar -xvf /tez-${TEZ_VERSION}-bin.tar.gz -C /opt/tez-${TEZ_VERSION} && rm /tez-${TEZ_VERSION}-bin.tar.gz
RUN cp -r /opt/tez-${TEZ_VERSION}/apache-tez-${TEZ_VERSION}-bin/* /opt/tez-${TEZ_VERSION}
RUN rm -rf /opt/tez-${TEZ_VERSION}/apache-tez-${TEZ_VERSION}-bin
RUN ln -s /opt/tez-${TEZ_VERSION} /opt/tez

COPY tez-site.xml /etc/hadoop

ENV TEZ_CONF=/etc/hadoop
ENV TEZ_JARS=/opt/tez
ENV TEZ_CLASSPATH=${TEZ_CONF}:${TEZ_JARS}/*:${TEZ_JARS}/lib/*
ENV HADOOP_CLASSPATH=${HADOOP_CLASSPATH}:${TEZ_CLASSPATH}

RUN hdfs dfs -chmod 777 /tmp
