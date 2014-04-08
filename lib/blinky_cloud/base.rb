require 'socket'

module BlinkyCloud
  class Base

    def socket
      @socket ||= UDPSocket.open
      @socket.setsockopt(:IPPROTO_IP, :IP_MULTICAST_TTL, 1)
      @socket
    end

  end
end
