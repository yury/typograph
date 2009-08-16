require "test/unit"

require File.expand_path(File.dirname(__FILE__) + '/../lib/typograph')

class TypographTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "привет всем!", Typograph.run("привет всем!")
  end

end