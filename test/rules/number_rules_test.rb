require "test/unit"
require File.dirname(__FILE__) + '/../../lib/rules/number_rules'

class NumberRulesTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "2&times;5", NumberRules.run("2x5")
    assert_equal " &frac12; ", NumberRules.run(" 1/2 ")
    assert_equal " &frac14; ", NumberRules.run(" 1/4 ")
    assert_equal " &frac34; ", NumberRules.run(" 3/4 ")
    assert_equal " &frac34; + &frac14; + &frac12; ", NumberRules.run(" 3/4 + 1/4 + 1/2 ")
  end

end