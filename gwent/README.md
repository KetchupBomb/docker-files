# Gwent ([not-gwent-online])

---

#### What

[not-gwent-online] is a fan-made adaptation of the in-game mini-game Gwent from [The Witcher 3](https://en.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt). [CD Project RED is creating their own, official Gwent](https://www.playgwent.com/en). But for the time being, this is a fair placeholder for fans.

#### How to use

[not-gwent-online] has three primary components that need to be configured correctly in order to work:

1. `--bind`: Specifies on which interface to bind
  - (Defaults to `0.0.0.0`, `127.0.0.1` in the original source code)
2. `--webserver`: Specific which port accepts HTTP traffic
  - (Defaults to `80` in Docker, `3000` in the original source code)
3. `--websocket`: Specifies which port accepts web server socket traffic
  - (Defaults to `8080` in Docker, `16918` in the original source code)

When you hit `host:80`, it returns JavaScript files that then try to speak to `host:8080`. Since the container has no idea what ephemeral ports Docker will have registered (say with `-P`), you _must_ specify ports _both_ **outside** and **inside** the container.

---

#### Example

Default, implicit arguments:
```shell
$ docker run -it --rm -p 80:80 -p 8080:8080 ketchupbomb/gwent
```

You can, however, override desired settings:

```shell
$ docker run -it --rm -p 88:88 -p 99:99 ketchupbomb/gwent --webserver 88 --websocket 99
```

> Just make sure that the exposed `-p`orts match the arguments (`--webserver` and `--websocket`)

[not-gwent-online]: https://github.com/exane/not-gwent-online
