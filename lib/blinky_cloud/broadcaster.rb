require 'blinky_cloud/base'

module BlinkyCloud
  class Broadcaster < BlinkyCloud::Base
    def broadcast!(data)
      socket.setsockopt(:IPPROTO_IP, :IP_MULTICAST_TTL, 1)
      socket.send(data, 0, MULTICAST_ADDR, PORT)
      socket.close
    end
  end
end
