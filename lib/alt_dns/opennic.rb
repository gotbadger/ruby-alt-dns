module AltDNS
  class OpenNic
    OPENNIC_TDLS = %w(
      bit
      bbs
      chan
      dyn
      free
      fur
      geek
      gopher
      indy
      neo
      null
      oss
      oz
      parody
      pirate
    )

    MATCH = /^(.*)\.(#{OPENNIC_TDLS.map(&Regexp.method(:escape)).join("|")})$/i

    def initialize(query)
      query.passthrough!(resolver)
    end

    def resolver
      servers = AltDNS.udp_and_tcp("185.83.217.248") +
                AltDNS.udp_and_tcp("5.9.49.12") +
                AltDNS.udp_and_tcp("193.183.98.154")
                AltDNS.udp_and_tcp("95.85.9.86")
      RubyDNS::Resolver.new(servers)
    end
  end
end
