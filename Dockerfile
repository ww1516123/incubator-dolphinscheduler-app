FROM ww1516123/incubator-dolphinscheduler-base:1.2.1

MAINTAINER maple "ww1516123@126.com"


ADD ./conf/zookeeper/zoo.cfg /opt/zookeeper/conf
ADD ./conf/maven/settings.xml /opt/maven/conf


# download
RUN cd /opt && \
    wget https://github.com/ww1516123/incubator-dolphinscheduler/archive/1.2.1.tar.gz && \
    tar -zxvf 1.2.1.tar.gz && \
    mv incubator-dolphinscheduler-1.2.1 dolphinscheduler_source && \
    rm -rf ./1.2.1.tar.gz

# backend build
RUN cd /opt/dolphinscheduler_source && \
    mvn -U clean package -Prelease -Dmaven.test.skip=true
#8,modify dolphinscheduler configuration file
#backend configuration
RUN tar -zxvf /opt/dolphinscheduler_source/dolphinscheduler-dist/target/apache-dolphinscheduler-incubating-1.2.1-dolphinscheduler-bin.tar.gz -C /opt && \
    mv /opt/apache-dolphinscheduler-incubating-1.2.1-dolphinscheduler-bin /opt/dolphinscheduler && \
    rm -rf /opt/dolphinscheduler/conf

ADD ./conf/dolphinscheduler/conf /opt/dolphinscheduler/conf

# nginx config
ADD ./conf/nginx/default.conf /etc/nginx/conf.d

COPY ./startup.sh /root/startup.sh

RUN chmod +x /root/startup.sh

# chomod
RUN chmod +x /root/startup.sh && \
  chmod +x /opt/dolphinscheduler/script/create-dolphinscheduler.sh && \
  chmod +x /opt/zookeeper/bin/zkServer.sh && \
  chmod +x /opt/dolphinscheduler/bin/dolphinscheduler-daemon.sh && \
  rm -rf /bin/sh && \
  ln -s /bin/bash /bin/sh && \
  mkdir -p /tmp/xls

# port
EXPOSE 2181 2888 3888 3306 80 12345 8888

ENTRYPOINT ["/root/startup.sh"]
