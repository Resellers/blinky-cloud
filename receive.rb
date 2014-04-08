#!/usr/bin/env ruby
require "socket"
require "ipaddr"
require 'blinky-tape-test-status'

MULTICAST_ADDR = "224.0.0.1"
BIND_ADDR = "0.0.0.0"
PORT = 3000

socket = UDPSocket.new
membership = IPAddr.new(MULTICAST_ADDR).hton + IPAddr.new(BIND_ADDR).hton

socket.setsockopt(:IPPROTO_IP, :IP_ADD_MEMBERSHIP, membership)
socket.setsockopt(:SOL_SOCKET, :SO_REUSEPORT, 1)

socket.bind(BIND_ADDR, PORT)

blinky = BlinkyTapeTestStatus.new :tty => '/dev/tty.usbmodemfd121'


loop do
  message, _ = socket.recvfrom(255)
  blinky.write! message
  puts message
end
