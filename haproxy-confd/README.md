haproxy combined with confd for HTTP load balancing

## Usage

Start the container making sure to expose port 80 on the host machine

```
docker run -e ETCD_HOST=172.17.42.1:4001 -p 80:80 yaron/haproxy-confd
```

Create at least one service inside of `/haproxy-discover/services`

```
etcdctl set "/haproxy-discover/services/myapp/domain" "myapp.com"
```