# Tasmodo

[Tasmota](https://tasmota.github.io/docs/) has an extensive
[list](https://tasmota.github.io/docs/Commands/) of commands it supports.
`tasmodo` is there to easily run those on your devices. It can use MQTT or HTTP
as a transport.

### Installation

If you put your binaries in `~/.local/bin`:

    PREFIX="$HOME/.local" make install

If you can't figure this out and want to use this tool anyway, message me.

#### Dependencies

For MQTT you need to install `mosquitto` for `mosquitto_pub`, and for HTTP
it'll use `curl` which you probably already have.

### Usage

When run without any options, `tasmodo` will print a short usage summary. As
you can use this as a reference, we will explore how it works using a few
examples here:

    tasmodo -t http -c 'Power ON' 192.168.1.91

This first example shows how to power on a device via http. If
`http://192.168.1.19` shows you the Tasmota UI in the browser, this should
work.

If you don't want to specify IP addresses you can use hostnames
([Hostname](https://tasmota.github.io/docs/Commands/#wi-fi) at the docs).
You'll need to have your router/DNS configured so it resolves them for you.
Most routers do this automatically or require a `.lan` or `.home` suffix.

The other way of contacting your Tasmota devices is MQTT. If you know where
your broker is running you can specify it with `-h` like this:

    tasmodo -h 192.168.1.1 -c 'Power ON' example-device

`device-name` in this context is configured with
[Topic](https://tasmota.github.io/docs/Commands/#mqtt). I'd advise configuring
your `Hostname` and `Topic` the same, so that the name for your device is the
same for both MQTT and HTTP.

If you don't specify a broker with `-h` it'll try using `avahi-browse` or
`dns-sd` to find one advertised with mDNS on your network. It picks the first
one that is returned.
