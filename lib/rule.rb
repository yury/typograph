require File.dirname(__FILE__) + '/tool'

# base class for all rules in typograph
class Rule

  NBSP = "&nbsp;"

  attr_accessor :text, :disabled

  def initialize text
    @text = text
    @disabled = false
    @rules = []
  end

  def add name, opts = {}
    @rules << {:name => name, :opts => opts}
  end

  def pre_parse

  end

  def parse
    return self.text if self.disabled

    self.pre_parse

    @rules.each do |rule|
      opts = rule[:opts]
      next if opts[:disabled]
      replacement = opts[:replacement]
      if replacement.class == Proc
        self.text.sub_each! opts[:pattern], &replacement
      else
        self.text.gsub! opts[:pattern], opts[:replacement]
      end
    end

    self.text
  end

  def post_parse

  end

  def self.run text
    t = self.new text
    t.parse
  end
  
end