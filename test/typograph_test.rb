# encoding: utf-8

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

if RUBY_VERSION < "1.9"
  require "rubygems"
  $KCODE='u'
end

require "minitest/unit"
require "typograph"

MiniTest::Unit.autorun

class TypographTest < MiniTest::Unit::TestCase

  include Typograph
  include Typograph::Rules

  def test_dash_rules
    assert_equal "как-то", DashRules.run("как-то")
    assert_equal "привет&nbsp;&mdash; привет", DashRules.run("привет - привет")
    assert_equal "с 2000&ndash;3000", DashRules.run("с 2000-3000")
    assert_equal "изза", DashRules.run("изза")
    assert_equal " из-за ", DashRules.run(" из -за ")
    assert_equal " как-то ", DashRules.run(" как- то ")
  end

  def test_etc_rules
    assert_equal "anjlab&trade;", EtcRules.run("anjlab(tm)")
    assert_equal "anjlab&copy;&nbsp;", EtcRules.run("anjlab(c) ")
    assert_equal "приве&#769;т", EtcRules.run("приве`т")
  end

  def test_math_rules
    assert_equal "2&times;5", MathRules.run("2x5")
    assert_equal " &frac12; ", MathRules.run(" 1/2 ")
    assert_equal " &frac14; ", MathRules.run(" 1/4 ")
    assert_equal " &frac34; ", MathRules.run(" 3/4 ")
    assert_equal " &frac34;&#8800;&frac12; ", MathRules.run(" 3/4!=1/2 ")
    assert_equal " &frac34; + &frac14; + &frac12; ", MathRules.run(" 3/4 + 1/4 + 1/2 ")
    assert_equal "&plusmn;", MathRules.run("+-")
    assert_equal "&plusmn;5", MathRules.run("+-5")
  end

  # punchamark rules tests
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

  def test_quote_rules
    assert_equal "&laquo;как-то&raquo;", QuoteRules.run('"как-то"')
    assert_equal "&laquo;как-то&raquo; &laquo;как-то&raquo;", QuoteRules.run('"как-то" "как-то"')
    assert_equal "привет всем &laquo;крутым&raquo; штукам", QuoteRules.run('привет всем "крутым" штукам')
    assert_equal "&laquo;как-то &laquo;как-то&raquo;", QuoteRules.run('"как-то "как-то""')
  end

  def test_complex_processing
    src = '"Кока-Кола" впервые появилась в СССР в 1979 году в
    ходе подготовки Олимпийских игр в Москве. Её автор -
    фармацевт Джон Стит Пембертон, бывший офицер американской
    Армии конфедерации!!!! ( сам напиток был придуман в 1886 году
    в штате Джорджия ) и дальше какая-то байда....'

    dest = '&laquo;Кока-Кола&raquo; впервые появилась в СССР в 1979 году в
    ходе подготовки Олимпийских игр в Москве. Её автор&nbsp;&mdash;
    фармацевт Джон Стит Пембертон, бывший офицер американской
    Армии конфедерации!!! (сам напиток был придуман в 1886 году
    в штате Джорджия) и дальше какая-то байда&hellip;'

    assert_equal dest, Typograph.run(src)
  end

end