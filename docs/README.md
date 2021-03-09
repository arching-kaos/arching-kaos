# arching-kaos-docs

> Documentation for installing and operating arching-kaos

## Description

### What's that for?

Installing and operating a web radio station with
- chat based on IRC protocol using `kiwiirc` for connecting with browser
- API for uploading and listing of radio mixes
- a web site that renders based on live information through the API

### How to use the repository?

1. Clone it!
	how 's that for start?
	`git clone <url>`

2. See [README.md](../README.md) to read the components

3. Setup the docker images, nginx, charybdis so arching-kaos can find its sources.

4. Happy arching kaos!

### What is it based upon?

1. It's based on icecast2 server to produce a stream.

   We just initialize a very simple but configured from our `./install.sh` script Icecast v2 docker image.

2. Uses IPFS to upload, provide links and sync mixes.

3. Uses DAT and Torrent to produce sync options.

4. Uses SSB to produce newsletter on SSB network.

5. Uses ReactJS to produce a webpage for the radio station.

6. Uses expressJS to create and run an API that holds a list of shows and an IP whitelist for authenticating uploaders.

7. Uses CJDNS network for unique IP per uploader.

8. Uses Liquidsoap to provide inputs to icecast2.

9. Uses charybdis-ircd for communication.

## How the installation works

After cloning the repository, you can review the `./install.sh` file, in order to configure basic parts of arching-kaos.

We will now go into a deep analysis of the `./install.sh` script and see what it does and also explain the values that can be edited in there.

We start with a small greeting to the user:
```
#!/bin/sh
echo "Getting the basics done..."
echo "Initializing and updating modules..."
```
### Submodules initiation

In the very first part of `./install.sh` we just pull the git modules that we want to include in our project.
To achieve that, we change our working directory to `./modules` where the modules are supposed to get downloaded.

```
cd modules
```

We are going to start with `arching-kaos-api`. 
```
git submodule init arching-kaos-api
git submodule update arching-kaos-api
```

We continue with `arching-kaos-radio`.
```
git submodule init arching-kaos-radio
git submodule update arching-kaos-radio
```
Add the `arching-kaos-generic`.
```
git submodule init arching-kaos-generic
git submodule update arching-kaos-generic
```
Also the `arching-kaos-ssb`.
```
git submodule init arching-kaos-ssb
git submodule update arching-kaos-ssb
```
The `arching-kaos-irc`.
```
git submodule init arching-kaos-irc
git submodule update arching-kaos-irc
```
And the `docker-dat-store`
```
git submodule init docker-dat-store
git submodule update docker-dat-store
```
We inform that we are done with the above
```
echo "Done!"
```
And we change back to our root directory (project's one).
```
cd ..
```
### Configuring `./etc`
Now, what we are going to do is simply replace variables placed in various files across the project to achieve correct settings before we run anything.
```
echo "Configuring ./etc ..."
```
We start with charybdis IRC daemon settings. Please adjust to your needs.
```
echo "...1/4 charybdis"
```
There are certain settings that need to be configured in charybdis. Our main approach is to have everything ready to get into a working state.
In `./install.sh` the following blocks from `./etc/charybdis/ircd.conf` are going to be edited.
```
serverinfo {
	name = "{$IRC_NAME}";
	sid = "{$IRC_SID}";
	description = "{$IRC_DESCRIPTION}";
	network_name = "{$IRC_NETNAME}";
	hub = yes;

	/* On multi-homed hosts you may need the following. These define
	 * the addresses we connect from to other servers. */
	/* for IPv4 */
	#vhost = "192.0.2.6";
	vhost = "{$PUBLIC_IPV4}";
	/* for IPv6 */
	#vhost6 = "{$PUBLIC_IPV6}";
	vhost6 = "{$CJDNS_IPV6}";
	#vhost6 = "2001:db8:2::6";
#	vhost = "127.0.0.1";
	/* ssl_private_key: our ssl private key */
#	ssl_private_key = "etc/ssl.key";
        ssl_private_key = "/etc/charybdis/ssl.key";
        ssl_cert = "/etc/charybdis/ssl.pem";
        ssl_dh_params = "/etc/charybdis/dh.pem";


	/* ssl_cert: certificate for our ssl server */
#	ssl_cert = "ssl.pem";
	/* ssl_dh_params: DH parameters, generate with openssl dhparam -out dh.pem 2048
	 * In general, the DH parameters size should be the same as your key's size.
	 * However it has been reported that some clients have broken TLS implementations which may
	 * choke on keysizes larger than 2048-bit, so we would recommend using 2048-bit DH parameters
	 * for now if your keys are larger than 2048-bit.
	 */
#	ssl_dh_params = "etc/dh.pem";

	/* ssld_count: number of ssld processes you want to start, if you
	 * have a really busy server, using N-1 where N is the number of
	 * cpu/cpu cores you have might be useful. A number greater than one
	 * can also be useful in case of bugs in ssld and because ssld needs
	 * two file descriptors per SSL connection.
	 */
	ssld_count = 1;

	/* default max clients: the default maximum number of clients
	 * allowed to connect.  This can be changed once ircd has started by
	 * issuing:
	 *   /quote set maxclients <limit>
	 */
	default_max_clients = 1024;

	/* nicklen: enforced nickname length (for this server only; must not
	 * be longer than the maximum length set while building).
	 */
	nicklen = 30;
};

admin {
	name = "{$ADMIN NAME}";
	description = "{$ADMIN_DESCRIPTION}";
	email = "{$ADMIN_EMAIL}";
};

listen {
	/* defer_accept: wait for clients to send IRC handshake data before
	 * accepting them.  if you intend to use software which depends on the
	 * server replying first, such as BOPM, you should disable this feature.
	 * otherwise, you probably want to leave it on.
	 */
	defer_accept = yes;

	/* If you want to listen on a specific IP only, specify host.
	 * host definitions apply only to the following port line.
	 */
	#host = "192.0.2.6";
#	port = 5000, 6665 .. 6669;
	host = "{$PUBLIC_IPV4}";
	sslport = 6697;
#	host = "{$PUBLIC_IPV6}":
#	sslport = 6697;
#	port = 6667;
	/* Listen on IPv6 (if you used host= above). */
	host = "{$CJDNS_IPV6}";
	port = 6667;
	#sslport = 9999;
};

auth {
	/* user: the user@host allowed to connect.  Multiple IPv4/IPv6 user
	 * lines are permitted per auth block.  This is matched against the
	 * hostname and IP address (using :: shortening for IPv6 and
	 * prepending a 0 if it starts with a colon) and can also use CIDR
	 * masks.
	 */
	user = "*@198.51.100.0/24";
	user = "*test@2001:db8:1:*";

	/* password: an optional password that is required to use this block.
	 * By default this is not encrypted, specify the flag "encrypted" in
	 * flags = ...; below if it is.
	 */
	password = "{$IRC_AUTH_PASSWORD}";
	
	/* spoof: fake the users user@host to be be this.  You may either
	 * specify a host or a user@host to spoof to.  This is free-form,
	 * just do everyone a favour and dont abuse it. (OLD I: = flag)
	 */
	spoof = "I.still.hate.packets";

	/* Possible flags in auth:
	 * 
	 * encrypted                  | password is encrypted with mkpasswd
	 * spoof_notice               | give a notice when spoofing hosts
	 * exceed_limit (old > flag)  | allow user to exceed class user limits
	 * kline_exempt (old ^ flag)  | exempt this user from k/g/xlines&dnsbls
	 * dnsbl_exempt		      | exempt this user from dnsbls
	 * spambot_exempt	      | exempt this user from spambot checks
	 * shide_exempt		      | exempt this user from serverhiding
	 * jupe_exempt                | exempt this user from generating
	 *                              warnings joining juped channels
	 * resv_exempt		      | exempt this user from resvs
	 * flood_exempt               | exempt this user from flood limits
	 *                                     USE WITH CAUTION.
	 * no_tilde     (old - flag)  | don't prefix ~ to username if no ident
	 * need_ident   (old + flag)  | require ident for user in this class
	 * need_ssl                   | require SSL/TLS for user in this class
	 * need_sasl                  | require SASL id for user in this class
	 */
	flags = kline_exempt, exceed_limit;
	
	/* class: the class the user is placed in */
	class = "opers";
};

operator "god" {
	/* name: the name of the oper must go above */

	/* user: the user@host required for this operator.  CIDR *is*
	 * supported now. auth{} spoofs work here, other spoofs do not.
 	 * multiple user="" lines are supported.
	 */
	user = "*god@127.0.0.1";

	/* password: the password required to oper.  Unless ~encrypted is
	 * contained in flags = ...; this will need to be encrypted using 
	 * mkpasswd, MD5 is supported
	 */
	password = "{$GOD_IRC_PASSWORD}";

	/* rsa key: the public key for this oper when using Challenge.
	 * A password should not be defined when this is used, see 
	 * doc/challenge.txt for more information.
	 */
	#rsa_public_key_file = "/usr/local/ircd/etc/oper.pub";

	/* umodes: the specific umodes this oper gets when they oper.
	 * If this is specified an oper will not be given oper_umodes
	 * These are described above oper_only_umodes in general {};
	 */
	#umodes = locops, servnotice, operwall, wallop;

	/* fingerprint: if specified, the oper's client certificate
	 * fingerprint will be checked against the specified fingerprint
	 * below.
	 */
	#fingerprint = "c77106576abf7f9f90cca0f63874a60f2e40a64b";

	/* snomask: specific server notice mask on oper up.
	 * If this is specified an oper will not be given oper_snomask.
	 */
	snomask = "+Zbfkrsuy";

	/* flags: misc options for the operator.  You may prefix an option
	 * with ~ to disable it, e.g. ~encrypted.
	 *
	 * Default flags are encrypted.
	 *
	 * Available options:
	 *
	 * encrypted:    the password above is encrypted [DEFAULT]
	 * need_ssl:     must be using SSL/TLS to oper up
	 */
	flags = ~encrypted;

	/* privset: privileges set to grant */
	privset = "admin";
};

```
We use `sed` to set the variables (`{$variables}`) to values.
```
sed -i.bak -e 's/{$IRC_NAME}/irc.arching-kaos.net/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_SID}/44Q/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_DESCRIPTION}/A friendly IRC server/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_NETNAME}/irc.arching-kaos.net/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$PUBLIC_IPV4}/127.0.0.1/g' etc/charybdis/ircd.conf
#sed -i.bak -e 's/{$PUBLIC_IPV6}//g' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$CJDNS_IPV6}/fc42:7cfa:b830:e988:f192:717f:6576:ed12/g' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$ADMIN NAME}/kaotisk/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$ADMIN_DESCRIPTION}/some descr/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_AUTH_PASSWORD}/somepass/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$GOD_IRC_PASSWORD}/somepass/' etc/charybdis/ircd.conf
```
And we continue with icecast2.
```
echo "...2/4 icecast"
sed -i.bak -e 's/{$LOCATION}/earth/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_RELAY_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_ADMIN_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_HOSTNAME}/icecast.arching-kaos.local/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$RADIO_WEBSITE_BASEURL}/http:\/\/radio.arching-kaos.local/' etc/icecast2/icecast.xml
```
There goes liquidsoap settings also.
```
echo "...3/4 liquidsoap"
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/liquidsoap/radio.liq
sed -i.bak -e 's/{$LIVE_SOURCE_PASSWORD}/hackmetoo/' etc/liquidsoap/radio.liq
```
And nginx files as well source files from the submodules and other places that need the same values.
```
echo "...4/4 nginx"
sed -i.bak -e 's/{$API_SERVER_NAME}/api.arching-kaos.local/g' etc/nginx/conf.d/api.conf modules/arching-kaos-radio/src/ShowList.js modules/arching-kaos-radio/src/Menu.js
sed -i.bak -e 's/{$DOCS_SERVER_NAME}/docs.arching-kaos.local/g' etc/nginx/conf.d/api.conf etc/nginx/conf.d/docs.conf
sed -i.bak -e 's/{$DOMAIN_NAME}/arching-kaos.local/g' etc/nginx/conf.d/default.conf modules/arching-kaos-radio/src/Signature.js
sed -i.bak -e 's/{$ICECAST_SERVER_NAME}/icecast.arching-kaos.local/g' etc/nginx/conf.d/icecast.conf modules/arching-kaos-radio/src/App.js modules/arching-kaos-radio/src/Menu.js modules/arching-kaos-radio/src/NowPlaying.js
sed -i.bak -e 's/{$IPFS_SERVER_NAME}/ipfs.arching-kaos.local/g' etc/nginx/conf.d/ipfs-gateway.conf modules/arching-kaos-api/config.js
sed -i.bak -e 's/{$IRC_SERVER_NAME}/irc.arching-kaos.local/g' etc/nginx/conf.d/irc.conf etc/thelounge/config.js
sed -i.bak -e 's/{$IRC_CLIENT}/http:\/\/127.0.0.1:9000/g' modules/arching-kaos-radio/src/Chat.js modules/arching-kaos-irc/index.html
sed -i.bak -e 's/{$RADIO_SERVER_NAME}/radio.arching-kaos.local/g' etc/nginx/conf.d/radio-arching.conf modules/arching-kaos-radio/src/Header.js
sed -i.bak -e 's/{$SSB_SERVER_NAME}/ssb.arching-kaos.local/g' etc/nginx/conf.d/ssb.conf etc/ssb-pub-data/config
sed -i.bak -e 's/{$TRACKER_SERVER_NAME}/tracker.arching-kaos.local/' etc/nginx/conf.d/tracker.conf
```
We, then, create a folder where the `arching-kaos-api` files will reside when we will run it. And also, copy some sample files for getting the API ready.
```
echo "Create API directories"
# sh ./modules/arching-kaos-api/api-dir.sh # Going the custom way again
export ARCHING_KAOS_API_DIR=$PWD/storage/.arching-kaos-api
mkdir -p $ARCHING_KAOS_API_DIR/downloads
cp modules/arching-kaos-api/ipList.json-sample $ARCHING_KAOS_API_DIR/ipList.json
cp modules/arching-kaos-api/shows.json-sample $ARCHING_KAOS_API_DIR/shows.json
```
### Starting docker images or build them in some cases

In folder `./scripts/` files starting with `docker-` are small scripts that start certain images for our project to work.

```
echo "Getting docker scripts ready ..."
echo "Proceeding arching-kaos installation ..."
```
#### Documentation
So we basically want to have our source documentation available so we start it from a script.
```
echo "Starting docs..."
sh ./scripts/docker-arching-kaos-docs.sh
echo "... done"
```
#### Icecast2
```
echo "Starting icecast..."
sh ./scripts/docker-icecast.sh
echo "... done"
```
#### IPFS
```
echo "Starting ipfs..."
sh ./scripts/docker-ipfs.sh
echo "... done"
```
#### Opentracker
```
echo "Starting opentracker..."
sh ./scripts/docker-opentracker.sh
echo "... done"
```
#### SSB
```
echo "Starting ssb..."
sh ./scripts/docker-ssb-create.sh
echo "... done"
```
#### Liquidsoap
```
echo "Starting liquidsoap..."
sh ./scripts/docker-liquidsoap.sh
echo "... done"
```
#### API
```
echo "Starting API..."
cd modules/arching-kaos-api
sh ./install.sh
cd ../..
sh ./modules/arching-kaos-api/run.sh
echo "... done"
```
#### Web interface for the radio
```
echo "Starting webpage..."
cd modules/arching-kaos-radio
./start.sh
echo "... done"
cd ../..
```
#### dat-store
```
echo "Starting dat-store..."
cd modules/docker-dat-store
sh ./build.sh
sh ./start.sh
echo "... done"
cd ../..
```
#### thelounge
```
echo "Starting thelounge..."
sh ./scripts/docker-thelounge.sh
echo "... done"
```
### Building last components
#### IRC (charybdis)
```
echo "Setting up IRC"
sh ./scripts/charybdis-simple-install.sh
cp etc/charybdis/ircd.conf $HOME/ircd/etc/ircd.conf
cp etc/charybdis/ircd.motd $HOME/ircd/etc/ircd.motd
echo "Starting IRC..."
$HOME/ircd/bin/charybdis
#TODO Insert crontab @reboot
```
### Patching everything into NGINX web proxy
```
echo "Starting NGINX..."
docker run --name nginx --restart always -d --network=host -v $PWD/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/modules/arching-kaos-generic:/srv/generic -v $PWD/modules/arching-kaos-irc:/srv/irc -v $PWD/modules/arching-kaos-ssb:/srv/ssb nginx
```
## There you go!
```
echo "Voila!"
```
