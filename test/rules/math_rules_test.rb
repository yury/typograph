require "test/unit"
require File.expand_path(File.dirname(__FILE__) + '/../../lib/typograph')

class MathRulesTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "2&times;5", MathRules.run("2x5")
    assert_equal " &frac12; ", MathRules.run(" 1/2 ")
    assert_equal " &frac14; ", MathRules.run(" 1/4 ")
    assert_equal " &frac34; ", MathRules.run(" 3/4 ")
    assert_equal " &frac34;&#8800;&frac12; ", MathRules.run(" 3/4!=1/2 ")
    assert_equal " &frac34; + &frac14; + &frac12; ", MathRules.run(" 3/4 + 1/4 + 1/2 ")
    assert_equal "&plusmn;" , MathRules.run("+-")
    assert_equal "&plusmn;5" , MathRules.run("+-5")
  end

end