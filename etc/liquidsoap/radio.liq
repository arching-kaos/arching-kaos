set("harbor.bind_addr","0.0.0.0")
set("server.telnet",true)
emergency = single("/radio/songs/some-song.ogg")
vmus = mksafe(playlist(reload=1440,"/radio/musik/"))
#ipfs = mksafe(playlist(reload=600,"/radio/ipfs-playlist.m3u"))
lists = mksafe(playlist(mode="normal",reload=36000,"/radio/current_playlist.m3u"))
live = input.harbor("live", port=3210, user="source", password="{$LIVE_SOURCE_PASSWORD}")
radio = fallback(track_sensitive=false, [live,lists,vmus,emergency])
output.icecast(
  %vorbis,
  radio,
  mount="demo.ogg",
  host="localhost",
  password="{$ICECAST_SOURCE_PASSWORD}",
  url="http://radio.arching-kaos.com",
  description="Arching Kaos radio is a collaborative webradio with friends."
)

