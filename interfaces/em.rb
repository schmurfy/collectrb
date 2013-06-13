
require 'eventmachine'

module CollectdProtocol
  class EMServer < Base
    def initialize(server, port = 25826, host = nil, interval = 10, bind_address = nil)

      @sock = EM::open_datagram_socket(bind_address || '127.0.0.1', nil)
      super(server, port, host, interval)
    end
    
    def flush
      @sock.send_datagram(@pkt.to_s, @server_address, @server_port)
    end
  end
end
