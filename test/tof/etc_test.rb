require "test/unit"
require "../../lib/tof/etc"

class EtcTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "anjlab&trade;", EtcTof.run("anjlab(tm)")
    assert_equal "anjlab&copy;&nbsp;", EtcTof.run("anjlab(c) ")
    assert_equal "приве&#769;т", EtcTof.run("приве`т")
  end

end