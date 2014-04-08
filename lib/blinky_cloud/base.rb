require 'socket'

module BlinkyCloud
  class Base
    MULTICAST_ADDR = "224.0.0.1"
    PORT = 54321

    def socket
      @socket ||= UDPSocket.open
    end

  end
end
