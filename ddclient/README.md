**Dynamic DNS client
**

Use this to register a server in a DNS that supports dynamic DNS.

Usage:
`docker run --rm yaronr/ddclient:latest  {dynamic_dns_server} {your_domain} {password} {dynamic_dns_protocol} {host} {sleep_interval_sec}`

{sleep_interval_sec} default = 3600, -1 means execute once and exit, with the appropriate exit code. Any other number / default - This process will exit, if the DNS registration is not successful (or it is terminated / interrupted). Otherwise it will continuously update the DNS.

All other params are required.

**Example:
**

`docker run --rm yaronr/ddclient:latest dynamicdns.park-your-domain.com mydomain.com pass1234 namecheap my-dns-server-name
`

I created this for two reasons:

1) I have a VPN client (yaronr/softether) that runs as a service, on a random hosts in my cluster. Using this, I can always refer to my VPN as 'my-vpn.my-domain.com' - regardless of where the VPN docker instance will actually run.

2) As it happens, I use CoreOS. Instead of manually doing `export FLEETCTL_TUNNEL=...` every time my cluster moves or one of my nodes die, I use the DDNS name in my export.

`
ExecStartPre=/bin/bash -cx  ' \
  echo "Updating ddns" \
  /usr/bin/docker run \
  --rm \
  yaronr/ddclient:latest dynamicdns.park-your-domain.com multicloud.me pass1234 namecheap vpn-${CLUSTER_NAME} -1'
`

**Note:
**
Some DNS providers require that a DNS 'A' record of the type you're trying to update, will pre-exist, for the update to succeed. To overcome this, just set a fake A record to 127.0.0.1 for the server you plan to update using ddclient (in the example above, vpn-${CLUSTER_NAME})