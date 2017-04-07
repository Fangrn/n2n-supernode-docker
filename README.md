# n2n-supernode-docker

## Environment Variables

### SUPERNODE_PORT

Port to listen on for connections (Default 7654)
pipesocks开始支持Docker了哦！！只需要修改几个环境变量：type、remotehost、remoteport、localport、password，分别代表类型（pump、pipe、tap）、远程主机地址、远程主机端口、本地端口、密码（默认端口7473）。不同的类型不一定这些环境变量都要设置：type设置成pump时只需要设置localport和password；type设置成pipe时只需要设置remotehost、remoteport和localport；type设置成tap时需要全部设置。别忘记把本机端口映射出去哦。
