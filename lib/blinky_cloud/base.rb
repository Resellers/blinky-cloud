require 'socket'

module BlinkyCloud
  class Base
    MULTICAST_ADDR = "224.1.1.1"
    PORT = 54321

    def socket
      @socket ||= UDPSocket.open
    end

  end
end
