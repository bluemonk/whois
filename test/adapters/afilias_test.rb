require 'test_helper'

class ServerAdaptersAfiliasTest < Test::Unit::TestCase
  include Whois

  def setup
    @definition = [".foo", "whois.foo", {}]
    @klass = Server::Adapters::Afilias
    @server = @klass.new(*@definition)
  end

  def test_query
    expected = "No match for DOMAIN.FOO."
    @server.expects(:ask_the_socket).with("domain.foo", "whois.afilias-grs.info", 43).returns(expected)
    assert_equal expected, @server.query("domain.foo")
  end

  def test_query_with_referral
    response = File.read(File.dirname(__FILE__) + "/../testcases/referrals/afilias.bz.txt")
    expected = "Match for DOMAIN.FOO."
    @server.expects(:ask_the_socket).with("domain.foo", "whois.afilias-grs.info", 43).returns(response)
    @server.expects(:ask_the_socket).with("domain.foo", "whois.belizenic.bz", 43).returns(expected)
    assert_equal expected, @server.query("domain.foo")
  end

end