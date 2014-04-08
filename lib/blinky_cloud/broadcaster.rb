module BlinkyCloud
  class Broadcaster < BlinkyCloud::Base

    MULTICAST_ADDR = "224.0.0.1"
    PORT = 3000

    def broadcast!(data)
      socket.send(data, 0, MULTICAST_ADDR, PORT)
      socket.close
    end
  end
end
