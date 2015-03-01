haproxy combined with confd for HTTP load balancing

## Usage

I apologise but I don't have the time to properly document this right now.
What's important to know:

* HAProxy 1.5.x backed by Confd 1.7.0 beta 1
* Uses zero-downtime reconfiguration (e.g - instead of harpy reload, which will drop all connections, will gradually transfer new connections to the new config)
* Added support for url rexeg (not reggae, damn you spell checker) for routing, in addition to the usual hostname pattern
* Added validation for existence of keys in backing kv store, to prevent failures




Start the container making sure to expose port 80 on the host machine

```
docker run -e ETCD_NODE=172.17.42.1:4001 -p 80:8080 yaronr/haproxy-confd
```

Create at least one service inside of `/haproxy-discover/services`

```
etcdctl set "/haproxy-discover/services/myapp/domain" "myapp.com"
```
