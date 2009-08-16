require "test/unit"
require File.expand_path(File.dirname(__FILE__) + '/../../lib/typograph')

class PunchmarkRulesTest < Test::Unit::TestCase

  def test_auto_comma
    assert_equal "вы будете, а я нет", PunchmarkRules.run("вы будете а я нет")
    assert_equal "вы будете, а я нет", PunchmarkRules.run("вы будете, а я нет")
  end

  def test_punctuation_marks_limit
    assert_equal "hello!!!", PunchmarkRules.run("hello!!!!!!!!!!!!!!!!!!")
    assert_equal "WTF???", PunchmarkRules.run("WTF???????")
  end

  def test_punctuation_marks_base_limit
    assert_equal ":", PunchmarkRules.run(":::")
    assert_equal ",", PunchmarkRules.run(",,")
  end

  def test_hellip
    assert_equal "&hellip;", PunchmarkRules.run("..")
    assert_equal "&hellip;", PunchmarkRules.run("...")
    assert_equal "&hellip;", PunchmarkRules.run("....")
  end

  def test_eng_apostrophe
    assert_equal "she&rsquo;s", PunchmarkRules.run("she's")
  end

  def test_fix_brackets
    assert_equal "(круто)", PunchmarkRules.run("( круто )")
  end

  def test_replacements
    
  end

end