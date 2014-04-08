module BlinkyCloud
  class Listener < BlinkyCloud::Base
    MULTICAST_ADDR = "224.0.0.1"
    BIND_ADDR = "0.0.0.0"
    PORT = 3000

    def listen
      socket = UDPSocket.new
      membership = IPAddr.new(MULTICAST_ADDR).hton + IPAddr.new(BIND_ADDR).hton

      socket.setsockopt(:IPPROTO_IP, :IP_ADD_MEMBERSHIP, membership)
      socket.setsockopt(:SOL_SOCKET, :SO_REUSEPORT, 1)

      socket.bind(BIND_ADDR, PORT)

      blinky = BlinkyTapeTestStatus::Base.new

      loop do
        message, _ = socket.recvfrom(255)
        blinky.write! message
        puts message
      end
    end
  end
  
end
