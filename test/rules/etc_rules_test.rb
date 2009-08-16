require "test/unit"
require File.expand_path(File.dirname(__FILE__) + '/../../lib/typograph')

class EtcRulesTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "anjlab&trade;", EtcRules.run("anjlab(tm)")
    assert_equal "anjlab&copy;&nbsp;", EtcRules.run("anjlab(c) ")
    assert_equal "приве&#769;т", EtcRules.run("приве`т")
  end

end