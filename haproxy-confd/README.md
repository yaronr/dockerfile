haproxy combined with confd for HTTP load balancing

## Usage

I apologise but I don't have the time to properly document this right now.
What's important to know:

* HAProxy 1.5.x backed by Confd 1.7.0 beta 1
* Uses zero-downtime reconfiguration (e.g - instead of harpy reload, which will drop all connections, will gradually transfer new connections to the new config)
* Added support for url rexeg (not reggae, damn you spell checker) for routing, in addition to the usual hostname pattern
* Added validation for existence of keys in backing kv store, to prevent failures


Create the paths allowing confd to find the services:
```bash
etcdctl mkdir "/haproxy-discover/services"
etcdctl mkdir "/haproxy-discover/tcp-services"
```

Depending on your needs, create one or more services or tcp-services.
For instance, to create an http service named *myapp* linked to the domain *example.org* and load balancing on servers *1.2.3.4:80* (we'll call it *nodeA*) and *2.3.4.5:80* (called *nodeB*), run these commands:
```bash
etcdctl set "/haproxy-discover/services/myapp/domain" "example.org"
etcdctl set "/haproxy-discover/services/myapp/upstreams/nodeA" "1.2.3.4:80"
etcdctl set "/haproxy-discover/services/myapp/upstreams/nodeB" "2.3.4.5:80"
```


Start the container making sure to expose port 80 on the host machine

```bash
docker run -e ETCD_NODE=172.17.42.1:4001 -p 1000:1000 -p 80:8080 yaronr/haproxy-confd
```


To *add an upstream node*, let's say *nodeB2*, *2.3.4.5:90*, you just have to run this, and the configuration should safely be updated !
```bash
etcdctl set "/haproxy-discover/services/myapp/upstreams/nodeB2" "2.3.4.5:90"
```

To *remove an upstream server*, let's say ... *nodeB2* (added by mistake ?), just run
```bash
etcdctl rm "/haproxy-discover/services/myapp/upstreams/nodeB2"
```

To *remove a service*, and so a directory, you must type
```bash
etcdctl rmdir "/haproxy-discover/services/myapp"
```

The commands for a tcp-service are the same but with *tcp-services* instead of *services*


Have fun !