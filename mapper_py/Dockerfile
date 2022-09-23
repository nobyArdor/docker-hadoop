FROM bde2020/hadoop-base:2.0.0-hadoop3.3.3-java8

RUN apt update
RUN apt install -y python3

COPY mapper.py /app/mapper.py
COPY reducer.py /app/reducer.py

ENV TOCOPY="/app/mapper.py,/app/reducer.py"
ENV INPUT="/lenta_articles"
ENV OUTPUT="/lenta_wordcount"
ENV MAPPER="python3 mapper.py"
ENV REDUCER="python3 reducer.py"
ENV JAR_FILEPATH="/opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar"


ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
