#
# = Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
#
# Category::    Net
# Package::     Whois
# Author::      Simone Carletti <weppos@weppos.net>
# License::     MIT License
#
#--
#
#++


module Whois

  module Version
    MAJOR = 1
    MINOR = 2
    PATCH = 2

    STRING = [MAJOR, MINOR, PATCH].compact.join(".")
  end

  VERSION = Version::STRING

end
