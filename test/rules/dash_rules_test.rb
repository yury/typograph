require "test/unit"
require File.dirname(__FILE__) + '/../../lib/rules/dash_rules'

class DashRulesTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "как-то", DashRules.run("как-то")
    assert_equal "привет&nbsp;&mdash; привет", DashRules.run("привет - привет")
    assert_equal "с 2000&ndash;3000", DashRules.run("с 2000-3000")
    assert_equal "изза", DashRules.run("изза")
    assert_equal " из-за ", DashRules.run(" из -за ")
    assert_equal " как-то ", DashRules.run(" как- то ")
  end

end