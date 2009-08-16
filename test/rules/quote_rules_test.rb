require "test/unit"
require File.expand_path(File.dirname(__FILE__) + '/../../lib/typograph')

class DashRulesTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "&laquo;как-то&raquo;", QuoteRules.run("\"как-то\"")
    assert_equal "&laquo;как-то&raquo; &laquo;как-то&raquo;", QuoteRules.run("\"как-то\" \"как-то\"")
    assert_equal "привет всем &laquo;крутым&raquo; штукам", QuoteRules.run("привет всем \"крутым\" штукам")
  end

end