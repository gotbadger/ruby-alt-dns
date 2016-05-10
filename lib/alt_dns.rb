require_relative "alt_dns/opennic"
require_relative "alt_dns/upstream"

module AltDNS
  def self.udp_and_tcp(address, port=53)
    [
      [:udp, address, port],
      [:tcp, address, port]
    ]
  end
end
