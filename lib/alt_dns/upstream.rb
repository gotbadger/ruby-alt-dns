module AltDNS
  class Upstream

    def initialize(query)
      query.passthrough!(resolver)
    end

    def resolver
      RubyDNS::Resolver.new(AltDNS.udp_and_tcp("8.8.8.8")+AltDNS.udp_and_tcp("8.8.4.4"))
    end

  end
end
