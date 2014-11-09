Dynamic DNS client

entrypoint.sh {dynamic_dns_server} {your_domain} {password} {dynamic_dns_protocol} {host} {sleep_interval_sec}

Example:
  entrypoint.sh dynamicdns.park-your-domain.com mydomain.com 12345 namecheap www

{sleep_interval_sec} default = 3600
All other params are required.

This process will exit, if the DNS registration is not successful (or it is terminated / interrupted).


I use this process in CoreOS, as a 'sidekick' process that runs on the same machine as my VPN service, and I use this to update the IP of my VPN (which is also a Docker instance).

