# incubator-dolphinscheduler-app

The docker for [incubator-dolphinscheduler](https://github.com/apache/incubator-dolphinscheduler) all in one.

Base of [incubator-dolphinscheduler-base](https://github.com/ww1516123/incubator-dolphinscheduler-base)

The Last Build version: [1.2.1](https://github.com/apache/incubator-dolphinscheduler/releases/tag/1.2.1)

## Machine configuration

	minimum configuration: Memory > 2G

## Run

eg:

```shell
docker run -d --name incubator-dolphinscheduler -p 8888:8888 ww1516123/incubator-dolphinscheduler
```

websiteUrl:http://[ip]:8888/

Username: `admin`

Passowrd:`dolphinscheduler123`

## Manual configuration

Application.properties

```properties
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# base spring data source configuration
spring.datasource.type=com.alibaba.druid.pool.DruidDataSource
# postgre
spring.datasource.driver-class-name=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://127.0.0.1:5432/dolphinscheduler
# mysql
#spring.datasource.driver-class-name=com.mysql.jdbc.Driver
#spring.datasource.url=jdbc:mysql://192.168.xx.xx:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8
spring.datasource.username=root
spring.datasource.password=root@123

# connection configuration
spring.datasource.initialSize=5
# min connection number
spring.datasource.minIdle=5
# max connection number
spring.datasource.maxActive=50

# max wait time for get a connection in milliseconds. if configuring maxWait, fair locks are enabled by default and concurrency efficiency decreases.
# If necessary, unfair locks can be used by configuring the useUnfairLock attribute to true.
spring.datasource.maxWait=60000

# milliseconds for check to close free connections
spring.datasource.timeBetweenEvictionRunsMillis=60000

# the Destroy thread detects the connection interval and closes the physical connection in milliseconds if the connection idle time is greater than or equal to minEvictableIdleTimeMillis.
spring.datasource.timeBetweenConnectErrorMillis=60000

# the longest time a connection remains idle without being evicted, in milliseconds
spring.datasource.minEvictableIdleTimeMillis=300000

#the SQL used to check whether the connection is valid requires a query statement. If validation Query is null, testOnBorrow, testOnReturn, and testWhileIdle will not work.
spring.datasource.validationQuery=SELECT 1

#check whether the connection is valid for timeout, in seconds
spring.datasource.validationQueryTimeout=3

# when applying for a connection, if it is detected that the connection is idle longer than time Between Eviction Runs Millis,
# validation Query is performed to check whether the connection is valid
spring.datasource.testWhileIdle=true

#execute validation to check if the connection is valid when applying for a connection
spring.datasource.testOnBorrow=true
#execute validation to check if the connection is valid when the connection is returned
spring.datasource.testOnReturn=false
spring.datasource.defaultAutoCommit=true
spring.datasource.keepAlive=true

# open PSCache, specify count PSCache for every connection
spring.datasource.poolPreparedStatements=true
spring.datasource.maxPoolPreparedStatementPerConnectionSize=20

spring.datasource.spring.datasource.filters=stat,wall,log4j
spring.datasource.connectionProperties=druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000

#mybatis
mybatis-plus.mapper-locations=classpath*:/org.apache.dolphinscheduler.dao.mapper/*.xml

mybatis-plus.typeEnumsPackage=org.apache.dolphinscheduler.*.enums

#Entity scan, where multiple packages are separated by a comma or semicolon
mybatis-plus.typeAliasesPackage=org.apache.dolphinscheduler.dao.entity

#Primary key type AUTO:" database ID AUTO ", INPUT:" user INPUT ID", ID_WORKER:" global unique ID (numeric type unique ID)", UUID:" global unique ID UUID";
mybatis-plus.global-config.db-config.id-type=AUTO

#Field policy IGNORED:" ignore judgment ",NOT_NULL:" not NULL judgment "),NOT_EMPTY:" not NULL judgment"
mybatis-plus.global-config.db-config.field-strategy=NOT_NULL

#The hump underline is converted
mybatis-plus.global-config.db-config.column-underline=true
mybatis-plus.global-config.db-config.logic-delete-value=-1
mybatis-plus.global-config.db-config.logic-not-delete-value=0
mybatis-plus.global-config.db-config.banner=false
#The original configuration
mybatis-plus.configuration.map-underscore-to-camel-case=true
mybatis-plus.configuration.cache-enabled=false
mybatis-plus.configuration.call-setters-on-nulls=true
mybatis-plus.configuration.jdbc-type-for-null=null

# master settings
# master execute thread num
master.exec.threads=100

# master execute task number in parallel
master.exec.task.num=20

# master heartbeat interval
master.heartbeat.interval=10

# master commit task retry times
master.task.commit.retryTimes=5

# master commit task interval
master.task.commit.interval=1000


# only less than cpu avg load, master server can work. default value : the number of cpu cores * 2
master.max.cpuload.avg=100

# only larger than reserved memory, master server can work. default value : physical memory * 1/10, unit is G.
master.reserved.memory=0.1

# worker settings
# worker execute thread num
worker.exec.threads=100

# worker heartbeat interval
worker.heartbeat.interval=10

# submit the number of tasks at a time
worker.fetch.task.num = 3

# only less than cpu avg load, worker server can work. default value : the number of cpu cores * 2
worker.max.cpuload.avg=100

# only larger than reserved memory, worker server can work. default value : physical memory * 1/6, unit is G.
worker.reserved.memory=0.1

# data quality analysis is not currently in use. please ignore the following configuration
# task record
task.record.flag=false
task.record.datasource.url=jdbc:mysql://192.168.xx.xx:3306/etl?characterEncoding=UTF-8
task.record.datasource.username=xx
task.record.datasource.password=xx

# Logger Config
#logging.level.org.apache.dolphinscheduler.dao=debug
```



common.properties

```properties
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#task queue implementation, default "zookeeper"
dolphinscheduler.queue.impl=zookeeper

#zookeeper cluster.  multiple are separated by commas.  eg. 192.168.xx.xx:2181,192.168.xx.xx:2181,192.168.xx.xx:2181
zookeeper.quorum=127.0.0.1:2181

#dolphinscheduler root directory
zookeeper.dolphinscheduler.root=/dolphinscheduler

#dolphinscheduler failover directory
zookeeper.session.timeout=300
zookeeper.connection.timeout=300
zookeeper.retry.base.sleep=100
zookeeper.retry.max.sleep=30000
zookeeper.retry.maxtime=5

# resource upload startup type : HDFS,S3,NONE
res.upload.startup.type=NONE

# Users who have permission to create directories under the HDFS root path
hdfs.root.user=hdfs

# data base dir, resource file will store to this hadoop hdfs path, self configuration, please make sure the directory exists on hdfs and have read write permissions。"/dolphinscheduler" is recommended
data.store2hdfs.basepath=/dolphinscheduler

# user data directory path, self configuration, please make sure the directory exists and have read write permissions
data.basedir.path=/tmp/dolphinscheduler

# directory path for user data download. self configuration, please make sure the directory exists and have read write permissions
data.download.basedir.path=/tmp/dolphinscheduler/download

# process execute directory. self configuration, please make sure the directory exists and have read write permissions
process.exec.basepath=/tmp/dolphinscheduler/exec


# whether kerberos starts
hadoop.security.authentication.startup.state=false

# java.security.krb5.conf path
java.security.krb5.conf.path=/opt/krb5.conf

# loginUserFromKeytab user
login.user.keytab.username=hdfs-mycluster@ESZ.COM

# loginUserFromKeytab path
login.user.keytab.path=/opt/hdfs.headless.keytab

# system env path. self configuration, please make sure the directory and file exists and have read write execute permissions
dolphinscheduler.env.path=/opt/dolphinscheduler/conf/env/dolphinscheduler_env.sh

#resource.view.suffixs
resource.view.suffixs=txt,log,sh,conf,cfg,py,java,sql,hql,xml,properties

# is development state? default "false"
development.state=true


# ha or single namenode,If namenode ha needs to copy core-site.xml and hdfs-site.xml
# to the conf directory，support s3，for example : s3a://dolphinscheduler
fs.defaultFS=hdfs://mycluster:8020

# s3 need，s3 endpoint
fs.s3a.endpoint=http://192.168.199.91:9010

# s3 need，s3 access key
fs.s3a.access.key=A3DXS30FO22544RE

# s3 need，s3 secret key
fs.s3a.secret.key=OloCLq3n+8+sdPHUhJ21XrSxTC+JK

#resourcemanager ha note this need ips , this empty if single
yarn.resourcemanager.ha.rm.ids=192.168.xx.xx,192.168.xx.xx

# If it is a single resourcemanager, you only need to configure one host name. If it is resourcemanager HA, the default configuration is fine
yarn.application.status.address=http://ark1:8088/ws/v1/cluster/apps/%s
# logger server rpc port
loggerserver.rpc.port=50051

```



alert.properties 

```properties
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#alert type is EMAIL/SMS
alert.type=EMAIL

# mail server configuration
mail.protocol=SMTP
mail.server.host=smtp.126.com
mail.server.port=
mail.sender=dolphinscheduler@126.com
mail.user=dolphinscheduler@126.com
mail.passwd=escheduler123

# TLS
mail.smtp.starttls.enable=false
# SSL
mail.smtp.ssl.enable=true
mail.smtp.ssl.trust=smtp.126.com

#xls file path,need create if not exist
xls.file.path=/tmp/xls

# Enterprise WeChat configuration
enterprise.wechat.enable=false
enterprise.wechat.corp.id=xxxxxxx
enterprise.wechat.secret=xxxxxxx
enterprise.wechat.agent.id=xxxxxxx
enterprise.wechat.users=xxxxxxx
enterprise.wechat.token.url=https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$corpId&corpsecret=$secret
enterprise.wechat.push.url=https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$token
enterprise.wechat.team.send.msg={\"toparty\":\"$toParty\",\"agentid\":\"$agentId\",\"msgtype\":\"text\",\"text\":{\"content\":\"$msg\"},\"safe\":\"0\"}
enterprise.wechat.user.send.msg={\"touser\":\"$toUser\",\"agentid\":\"$agentId\",\"msgtype\":\"markdown\",\"markdown\":{\"content\":\"$msg\"}}
```

quartz.properties

```properties
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#============================================================================
# Configure Main Scheduler Properties
#============================================================================
org.quartz.scheduler.instanceName = DolphinScheduler
org.quartz.scheduler.instanceId = AUTO
org.quartz.scheduler.makeSchedulerThreadDaemon = true
org.quartz.jobStore.useProperties = false

#============================================================================
# Configure ThreadPool
#============================================================================

org.quartz.threadPool.class = org.quartz.simpl.SimpleThreadPool
org.quartz.threadPool.makeThreadsDaemons = true
org.quartz.threadPool.threadCount = 25
org.quartz.threadPool.threadPriority = 5

#============================================================================
# Configure JobStore
#============================================================================

org.quartz.jobStore.class = org.quartz.impl.jdbcjobstore.JobStoreTX
org.quartz.jobStore.driverDelegateClass = org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
org.quartz.jobStore.tablePrefix = QRTZ_
org.quartz.jobStore.isClustered = true
org.quartz.jobStore.misfireThreshold = 60000
org.quartz.jobStore.clusterCheckinInterval = 5000
org.quartz.jobStore.dataSource = myDs

#============================================================================
# Configure Datasources
#============================================================================
org.quartz.dataSource.myDs.connectionProvider.class = org.apache.dolphinscheduler.server.quartz.DruidConnectionProvider
org.quartz.dataSource.myDs.driver = org.postgresql.Driver
org.quartz.dataSource.myDs.URL=jdbc:postgresql://127.0.0.1:5432/dolphinscheduler
org.quartz.dataSource.myDs.user=root
org.quartz.dataSource.myDs.password=root@123
org.quartz.dataSource.myDs.maxConnections = 10
org.quartz.dataSource.myDs.validationQuery = select 1
```

**Eg:**

```shell
docker run -d --name incubator-dolphinscheduler -v ./quartz.properties:/opt/dolphinscheduler/conf/quartz.properties -v ww1516123/incubator-dolphinscheduler
```

**hdfs-setting:**
If you use hdfs-related functions, you need to copy hdfs-site.xml and core-site.xml to the conf directory

```shell
docker run -d --name incubator-dolphinscheduler  -v ./core-site.xml:/opt/dolphinscheduler/conf/core-site.xml  -v ./hdfs-site.xml:/opt/dolphinscheduler/conf/hdfs-site.xml  -v ./quartz.properties:/opt/dolphinscheduler/conf/quartz.properties -p 8888:8888 ww1516123/incubator-dolphinscheduler
```

