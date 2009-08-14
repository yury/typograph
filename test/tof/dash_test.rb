require "test/unit"
require "../../lib/tof/dash"

class DashTest < Test::Unit::TestCase

  def test_replacements
    assert_equal "как-то", Dash.run("как-то")
    assert_equal "привет&nbsp;&mdash; привет", Dash.run("привет - привет")
    assert_equal "с 2000&ndash;3000", Dash.run("с 2000-3000")
    assert_equal "изза", Dash.run("изза")
    assert_equal " из-за ", Dash.run(" из -за ")
    assert_equal " как-то ", Dash.run(" как- то ")
  end

end