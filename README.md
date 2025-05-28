项目仓库https://gitee.com/superrock123/one-stop.git

## 初始化项目配置

**初始化数据库**

`create database onestop;`

`mysql -u root -p onestop <你的文件路径/onestop.sql`

**配置文件系统Minio**

下载Minio server

使用cmd进入*minio.exe*文件目录

执行命令

`minio.exe server D:\Program Files\Minio\minio-data --console-address ":9001"`
`pause`

访问文件系统前台9001端口

创建一个名为files的bucket

将access policy改为public

## SpringBoot初始化

使用maven加载项目依赖

配置application.yml参数

运行

## 前端项目初始化

安装node.js

管理员身份运行nodeCommandLine

进入vue文件夹

运行

`npm i`

`npm run server`

访问[localhost:8080](https:localhost:8080)

调试接口(http://localhost:9090/swagger-ui/index.html#/)

## 代码提交规范

feat(功能) fix(修复) refactor(重构格式) 例如 git commit -m "feat: 添加用户登录功能"

