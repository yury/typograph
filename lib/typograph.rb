require File.join(File.dirname(__FILE__), 'rule')
require File.join(File.dirname(__FILE__), 'rules', 'dash_rules')
require File.join(File.dirname(__FILE__), 'rules', 'etc_rules')
require File.join(File.dirname(__FILE__), 'rules', 'math_rules')
require File.join(File.dirname(__FILE__), 'rules', 'punchmark_rules')
require File.join(File.dirname(__FILE__), 'rules', 'quote_rules')

class Typograph

  @@rules = [QuoteRules.new, DashRules.new, PunchmarkRules.new, MathRules.new, EtcRules.new]

  def self.run text
    for rule in @@rules
      rule.text = text
      text = rule.parse
    end
    text
  end
end