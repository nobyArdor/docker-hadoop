FROM bde2020/hadoop-base-with-tez:3.3.3-java8

HEALTHCHECK --interval=30s --timeout=10s --start-period=5m CMD curl -f http://localhost:10002/ || exit 1

ENV HIVE_VER=3.1.3
ENV POSTGRESQL_VER=42.4.0

RUN curl -fSL https://dlcdn.apache.org/hive/hive-${HIVE_VER}/apache-hive-${HIVE_VER}-bin.tar.gz  \
    -o apache-hive-${HIVE_VER}.tar.gz

RUN tar -xvf /apache-hive-$HIVE_VER.tar.gz -C /opt/ && rm /apache-hive-$HIVE_VER.tar.gz
RUN ln -s /opt/apache-hive-${HIVE_VER}-bin /opt/hive
RUN rename 's/properties.template/properties/' /opt/hive/conf/*.properties.template

ENV HIVE_HOME=/opt/hive

RUN curl -fSL https://jdbc.postgresql.org/download/postgresql-$POSTGRESQL_VER.jar -o /opt/hive/lib/postgresql-$POSTGRESQL_VER.jar

ADD hive-site.xml /opt/hive/conf
ADD hive-env.sh /opt/hive/conf

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 10000 10002

CMD ["/run.sh"]	
