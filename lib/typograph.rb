module Typograph
  autoload :Rules, 'typograph/rules'

  @@rules = [Rules::QuoteRules.new,
             Rules::DashRules.new,
             Rules::PunchmarkRules.new,
             Rules::MathRules.new,
             Rules::EtcRules.new] 

  def self.run! text
    for rule in @@rules
      next if rule.disabled
      text = rule.parse text
    end
    text
  end

  def self.run text
    self.run! text.dup
  end
end

require 'typograph/string_sub_each'