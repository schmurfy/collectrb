
require 'eventmachine'

module CollectdProtocol
  class EMServer < Base
    def initialize(server, port = 25826, host = nil, interval = 10)

      @sock = EM::open_datagram_socket('0.0.0.0', nil)
      super
    end
    
    def flush
      @sock.send_datagram(@pkt.to_s, @server_address, @server_port)
    end
  end
end
