FROM 192.168.150.83:15000/m8928/hadoop-base-with-tez:3.2.2-java8

HEALTHCHECK --interval=30s --timeout=10s --start-period=5m CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
