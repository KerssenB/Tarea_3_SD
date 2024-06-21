FROM suhothayan/hadoop-spark-pig-hive:2.9.2

USER root

RUN chmod +x /usr/local/spark/conf/spark-env.sh
RUN chmod -R +x /usr/local/spark/conf

CMD /etc/bootstrap.sh && tail -f /dev/null