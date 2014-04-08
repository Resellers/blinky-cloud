blinky-cloud
============

Beowulf cluster for BlinkyTape

Requirements
============

* ruby
* a [blinky tape](http://blinkinlabs.com/blinkytape/)

Installation
============

`gem install blinky-cloud`

Command Line Usage
==================

As a listener:

1. Plug in your blinky tape
1. run `blinky-cloud-listen`

As a broadcaster:

1. run `blinky-cloud-broadcast` passing the characters you wish to send to the
blinky tape

Talking to Blinky Tape
----------------------

Flashing Green:

`blinky-cloud-broadcast fg`

Pulsing Blue:

`blinky-cloud-broadcast pb`

Solid White:

`blinky-cloud-broadcast sw`

Set Brightness to 50%:

`blinky-cloud-broadcast 5`

For more commands, see the [blinky tape test status README](https://github.com/integrum/blinky-tape-test-status)
