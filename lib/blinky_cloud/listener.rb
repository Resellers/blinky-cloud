require "ipaddr"
require 'blinky_cloud/base'

module BlinkyCloud
  class Listener < BlinkyCloud::Base
    BIND_ADDR = "0.0.0.0"

    def listen(callback)
      socket = UDPSocket.new
      membership = IPAddr.new(MULTICAST_ADDR).hton + IPAddr.new(BIND_ADDR).hton

      socket.setsockopt(:IPPROTO_IP, :IP_ADD_MEMBERSHIP, membership)
      socket.setsockopt(:SOL_SOCKET, :SO_REUSEPORT, 1)

      socket.bind(BIND_ADDR, PORT)

      loop do
        message, _ = socket.recvfrom(255)
        callback.call(message)
      end
    end
  end
end
