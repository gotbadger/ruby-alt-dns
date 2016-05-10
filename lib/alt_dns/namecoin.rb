# NB: opennic actually implements namecoin now
# module AltDNS
#   class Namecoin
#
#     MATCH = /^(.*)\.(bit)$/i
#
#     attr_accessor :query
#
#     def initialize(query)
#       @query = query
#
#       keyname = "d/#{query.question.to_s.match(MATCH)[1].split(".").last}"
#
#       begin
#         puts "looking up #{keyname}"
#         name_scan = `namecoind name_scan #{keyname} 1`
#         # read result and only match if exact
#         result = JSON.parse(name_scan).find {|r| r["name"] == "d/#{name}" }
#         unless result.nil?
#           record = JSON.parse result["value"]
#           ip = get_ip(record)
#           if ip
#             tx.respond! ip
#             return
#           end
#         end
#       rescue JSON::ParserError
#         nxdomain
#       end
#
#       nxdomain
#     end
#
#
#     def get_ip
#       # does not fully implement domain spec so wil be kind of naive
#       # https://wiki.namecoin.org/index.php?title=Domain_Name_Specification
#
#     end
#
#     def nxdomain
#       query.fail! :NXDomain
#     end
#   end
# end
