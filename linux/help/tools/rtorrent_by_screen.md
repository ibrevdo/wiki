# rtorrent by screen

```sh
Start a screen session named rtor_sess. From within it you can now run your rtorrent tasks.
$ screen -S rtor_sess

When you're done starting them up or checking in on them you can disconnect from the screen session with the key combination Control+A+D. 
Remember: (Attention + Disconnect).

After some time has passed and you want to peek in on your rtorrent task, you can SSH back into the system where you're screen session was started and do the following commands to see your sessions:

$ screen -ls
There are screens on:
1506.bp (Detached)
2335.rtorr_sess (Detached)
32090.dl    (Detached)
3 Sockets in /var/run/screen/S-root.

Here you can see that I have 3 sessions. So let's reconnect to our rtorr_sess session:

$ screen -r rtorr_sess

Again to disconnect use the same key combination we used before to disconnect. 
When you're done you simply exit out of the session to destroy it.

```
