require "rubydns"

require_relative "lib/alt_dns"

BIND_ADDRESS = "0.0.0.0".freeze
BIND_PORT = 53

UPSTREAM = RubyDNS::Resolver.new(AltDNS.udp_and_tcp(BIND_ADDRESS))
Name = Resolv::DNS::Name
IN = Resolv::DNS::Resource::IN


RubyDNS::run_server(listen: AltDNS.udp_and_tcp(BIND_ADDRESS, BIND_PORT)) do


  # match(AltDNS::Namecoin::MATCH, IN::A) { |query| AltDNS::Namecoin.new(query) }

  match(AltDNS::OpenNic::MATCH, IN::A) { |query| AltDNS::OpenNic.new(query) }

  # lastly use upstream matcher
  otherwise { |query| AltDNS::Upstream.new(query) }
end
