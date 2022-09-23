#!/bin/bash

$HADOOP_HOME/bin/hdfs dfs -rm -r -f /lenta_wordcount
$HADOOP_HOME/bin/hdfs dfs -put /data/lenta_articles /
$HADOOP_HOME/bin/hadoop jar $JAR_FILEPATH -files $TOCOPY -input $INPUT -output $OUTPUT -mapper "$MAPPER" -reducer "$REDUCER"
