module Typograph
  autoload :Rules, 'typograph/rules'

  @@rules = [Rules::QuoteRules.new,
             Rules::DashRules.new,
             Rules::PunchmarkRules.new,
             Rules::MathRules.new,
             Rules::EtcRules.new] 

  def self.run text
    for rule in @@rules
      rule.text = text
      text = rule.parse
    end
    text
  end
end

require 'typograph/string_sub_each'