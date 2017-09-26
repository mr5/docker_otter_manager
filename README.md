## docker_otter_manager
docker for otter_manager

## 环境变量

* DOMAIN_NAME: web 控制台域名
* HTTP_PORT: [可选] web 控制台端口号，默认为 `80`
* COMM_PORT: [可选] node 通信端口号，默认为 `1099`
* DB_HOST: 数据库地址
* DB_PORT: [可选] 数据库端口号，默认值为 `3306`
* DB_NAME: [可选] 数据库名称，默认值为 `otter`
* DB_USER: 数据库用户名
* DB_PASSWORD: 数据库密码
* MAX_MEN: [可选] 进程最大可用内存，默认值为 `3072m`
* ZK_DEFAULT: 默认的 zookeeper ip:port
* ZK_TIMEOUT: [可选] zookeeper session 超时时间，单位是毫秒，默认值 `600000`
* SMTP_HOST: [可选] 
* SMTP_USERNAME: [可选] 
* SMTP_PASSWORD: [可选] 
* SMTP_PORT: [可选]