
module Collectd
  class SocketServer < Base
    def initialize(server, port, host, interval)
      @sock = UDPSocket.new(Socket::AF_INET)
      @sock.connect(server, port)
      super
    end
    
    def flush
      @sock.send(@pkt.to_s, 0) rescue SystemCallError
    end
  end
end
