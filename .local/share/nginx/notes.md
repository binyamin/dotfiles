# Nginx notes

To view nginx metadata, like the default html folder, tr `nginx -V`.

**Logs** are located in `/var/log/nginx/access.log` and `/var/log/nginx/error.log`.


## Stats (accessible)
```sh
# Cmd: `stat /usr/share/nginx/html/foo.html`
  File: /usr/share/nginx/html/foo.html
  Size: 221             Blocks: 8          IO Block: 4096   regular file
Device: 803h/2051d      Inode: 8532635     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-08-24 15:48:04.596058308 -0400
Modify: 2021-08-24 15:47:58.376057229 -0400
Change: 2021-08-24 15:47:58.376057229 -0400
 Birth: 2021-08-24 15:47:58.376057229 -0400
```

```sh
# Cmd: `stat /usr/share/nginx/html/index.html`
  File: /usr/share/nginx/html/index.html
  Size: 612             Blocks: 8          IO Block: 4096   regular file
Device: 803h/2051d      Inode: 8526400     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-08-24 12:55:57.404151023 -0400
Modify: 2021-05-25 08:35:38.000000000 -0400
Change: 2021-05-28 17:23:21.335216675 -0400
 Birth: 2021-05-28 17:23:21.259216463 -0400
```
```sh
# Cmd: `stat /usr/share/nginx/html`
  File: /usr/share/nginx/html
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 803h/2051d      Inode: 8526398     Links: 2
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-08-24 15:48:43.072065055 -0400
Modify: 2021-08-24 15:48:42.500064954 -0400
Change: 2021-08-24 15:55:56.776367821 -0400
 Birth: 2021-05-28 17:17:51.798260106 -0400
```

### Stats (not accessible)
```sh
# Cmd: `stat /usr/share/nginx/html/www`
  File: /usr/share/nginx/html/www -> /home/binyamin/www
  Size: 18              Blocks: 0          IO Block: 4096   symbolic link
Device: 803h/2051d      Inode: 8532636     Links: 1
Access: (0777/lrwxrwxrwx)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-08-24 15:48:43.072065055 -0400
Modify: 2021-08-24 15:48:42.500064954 -0400
Change: 2021-08-24 15:48:42.500064954 -0400
 Birth: 2021-08-24 15:48:42.500064954 -0400
```

```sh
# Cmd: `stat /home/binyamin/www`
  File: /home/binyamin/www
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 803h/2051d      Inode: 2233031     Links: 4
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-08-24 16:00:48.636576054 -0400
Modify: 2021-08-24 15:25:10.860057992 -0400
Change: 2021-08-24 16:00:37.140568968 -0400
 Birth: 2021-05-28 17:17:51.798260106 -0400
```