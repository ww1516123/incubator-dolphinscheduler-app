# incubator-dolphinscheduler-app

The docker for [incubator-dolphinscheduler](https://github.com/apache/incubator-dolphinscheduler) all in one.

Base of [incubator-dolphinscheduler-base](https://github.com/ww1516123/incubator-dolphinscheduler-base)

The Last Build version: [1.1.0](https://github.com/apache/incubator-dolphinscheduler/releases/tag/1.1.0)

## Machine configuration

	minimum configuration: Memory > 2G

## Run

eg:

```shell
docker run -d --name incubator-dolphinscheduler -p 8888:8888 ww1516123/incubator-dolphinscheduler
```

websiteUrl:http://[ip]:8888/

Username: `admin`

Passowrd:`escheduler123`

## Manual configuration

master.properties
```properties
# master execute thread num
master.exec.threads=100

# master execute task number in parallel
master.exec.task.number=20

# master heartbeat interval
master.heartbeat.interval=10

# master commit task retry times
master.task.commit.retryTimes=5

# master commit task interval
master.task.commit.interval=100


# only less than cpu avg load, master server can work. default value : the number of cpu cores * 2
master.max.cpuload.avg=10

# only larger than reserved memory, master server can work. default value : physical memory * 1/10, unit is G.
master.reserved.memory=0.5
```

worker.properties 

```properties
# worker execute thread num
worker.exec.threads=100

# worker heartbeat interval
worker.heartbeat.interval=10

# submit the number of tasks at a time
worker.fetch.task.num = 3


# only less than cpu avg load, worker server can work. default value : the number of cpu cores * 2
#worker.max.cpuload.avg=10

# only larger than reserved memory, worker server can work. default value : physical memory * 1/6, unit is G.
worker.reserved.memory=0.5
```

alert.properties 

```properties
#alert type is EMAIL/SMS
alert.type=EMAIL

# mail server configuration
mail.protocol=SMTP
mail.server.host=smtp.office365.com
mail.server.port=587
mail.sender=qiaozhanwei@outlook.com
mail.passwd=eschedulerBJEG

# TLS
mail.smtp.starttls.enable=true
# SSL
mail.smtp.ssl.enable=false

#xls file path,need create if not exist
xls.file.path=/tmp/xls

# Enterprise WeChat configuration
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
#============================================================================
# Configure Main Scheduler Properties
#============================================================================
org.quartz.scheduler.instanceName = EasyScheduler
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
org.quartz.jobStore.driverDelegateClass = org.quartz.impl.jdbcjobstore.StdJDBCDelegate
org.quartz.jobStore.tablePrefix = QRTZ_
org.quartz.jobStore.isClustered = true
org.quartz.jobStore.misfireThreshold = 60000
org.quartz.jobStore.clusterCheckinInterval = 5000
org.quartz.jobStore.dataSource = myDs

#============================================================================
# Configure Datasources  
#============================================================================
org.quartz.dataSource.myDs.connectionProvider.class = cn.escheduler.server.quartz.DruidConnectionProvider
org.quartz.dataSource.myDs.driver = com.mysql.jdbc.Driver
org.quartz.dataSource.myDs.URL=jdbc:mysql://127.0.0.1:3306/escheduler?characterEncoding=utf8
org.quartz.dataSource.myDs.user=root
org.quartz.dataSource.myDs.password=root@123
org.quartz.dataSource.myDs.maxConnections = 10
org.quartz.dataSource.myDs.validationQuery = select 1
```

**Eg:**

```shell
docker run -d --name incubator-dolphinscheduler -v ./worker.properties://opt/escheduler/conf/worker.properties -v ./master.properties://opt/escheduler/conf/master.properties -p 8888:8888 ww1516123/incubator-dolphinscheduler
```

