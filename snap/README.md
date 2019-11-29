# A simple DVB receiver snap example

## Building

### Install snapcraft

```Shell
$ sudo apt install snapcraft
```

### Get the latest updates

```Shell
$ cd sdrsatcom-workshop

$ git pull
```

### Build the snap

```Shell
$ cd snap

$ snapcraft
```
## Installation

```Shell
$ sudo snap install --devmode limedvbrx_0.0.1_amd64.snap
```

Note that the "devmode" option is required since the snap is not signed and
therefore we need to bypass container security. Since we do this, we also don't
need to connect the snap to USB with "snap connect".

In practice, once we're happy with our snap we would sign this and then publish
it to the app store so that it can be easily installed by others.

## Running the example

```Shell
$ limedvbrx
```

Note that if you wanted to change any settings you would need to edit the
"limedvbrx" script and rebuild the snap with "snapcraft clean" followed by
"snapcraft" again. Then uninstall the old snap with "snapcraft remove" and
repeat the installation step.

Obviously this is just a quick demonstration of how to build a very simple snap
and in practice you might parameterise the script, have it read a config file or
create a simple GUI launcher.
