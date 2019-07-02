# Should work on all Debian based distros with systemd; tested on Ubuntu 16.04+.
# This will by default install all plugins; you can customize this behavior on line 6. Selecting too many plugins can cause issues when downloading. 
# Run as root (or sudo before every line) please. Note this is not designed to be run automatically; I recommend executing this line by line.

apt install curl
curl https://getcaddy.com | bash -s personal dns,docker,dyndns,hook.service,http.authz,http.awses,http.awslambda,http.cache,http.cgi,http.cors,http.datadog,http.expires,http.filemanager,http.filter,http.forwardproxy,http.geoip,http.git,http.gopkg,http.grpc,http.hugo,http.ipfilter,http.jekyll,http.jwt,http.locale,http.login,http.mailout,http.minify,http.nobots,http.prometheus,http.proxyprotocol,http.ratelimit,http.realip,http.reauth,http.restic,http.upload,http.webdav,net,tls.dns.auroradns,tls.dns.azure,tls.dns.cloudflare,tls.dns.cloudxns,tls.dns.digitalocean,tls.dns.dnsimple,tls.dns.dnsmadeeasy,tls.dns.dnspod,tls.dns.dyn,tls.dns.exoscale,tls.dns.gandi,tls.dns.gandiv5,tls.dns.godaddy,tls.dns.googlecloud,tls.dns.lightsail,tls.dns.linode,tls.dns.namecheap,tls.dns.ns1,tls.dns.otc,tls.dns.ovh,tls.dns.powerdns,tls.dns.rackspace,tls.dns.rfc2136,tls.dns.route53,tls.dns.vultr
chown root:root /usr/local/bin/caddy
chmod 755 /usr/local/bin/caddy
setcap 'cap_net_bind_service=+eip' /usr/local/bin/caddy
mkdir -p /etc/caddy
chown -R root:www-data /etc/caddy
mkdir -p /etc/ssl/caddy
chown -R www-data:root /etc/ssl/caddy
chmod 770 /etc/ssl/caddy
touch /etc/caddy/Caddyfile
mkdir -p /var/www
chown www-data:www-data /var/www
chmod 755 /var/www
curl -L https://github.com/mholt/caddy/raw/master/dist/init/linux-systemd/caddy.service | sed "s/;CapabilityBoundingSet/CapabilityBoundingSet/" | sed "s/;AmbientCapabilities/AmbientCapabilities/" | sed "s/;NoNewPrivileges/NoNewPrivileges/" | tee /etc/systemd/system/caddy.service
chown root:root /etc/systemd/system/caddy.service
chmod 744 /etc/systemd/system/caddy.service
systemctl daemon-reload
systemctl enable caddy.service

# If you need caddy to be up now:
# systemctl start caddy.service

# if you need QUIC protocol:
# 1. edit /etc/systemd/system/caddy.service, write " -quic" (without quotes) to the end of the line ExecStart
# 2. systemctl daemon-reload
# 3. systemctl restart caddy