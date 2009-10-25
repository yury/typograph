# encoding: utf-8
module Typograph
  module Rules

    autoload :DashRules, 'typograph/rules/dash_rules'
    autoload :EtcRules, 'typograph/rules/etc_rules'
    autoload :MathRules, 'typograph/rules/math_rules'
    autoload :PunchmarkRules, 'typograph/rules/punchmark_rules'
    autoload :QuoteRules, 'typograph/rules/quote_rules'

    # base class for all rules in typograph
    class Rule

      NBSP = "&nbsp;"
      QUOTE_FIRS_OPEN = '&laquo;';
      QUOTE_FIRS_CLOSE = '&raquo;';
      QUOTE_CRAWSE_OPEN = '&bdquo;';
      QUOTE_CRAWSE_CLOSE = '&ldquo;';

      attr_accessor :disabled

      def initialize
        @disabled = false
        @rules = []
      end

      def add name, opts = {}
        @rules << {:name => name, :opts => opts}
      end

      def pre_parse text
        text
      end

      def post_parse text
        text
      end

      def parse text
        return text if self.disabled

        text = self.pre_parse text

        @rules.each do |rule|
          opts = rule[:opts]
          next if opts[:disabled]
          replacement = opts[:replacement]
          if replacement.class == Proc
            text.sub_each! opts[:pattern], &replacement
          else
            text.gsub! opts[:pattern], opts[:replacement]
          end
        end

        self.post_parse text
      end

      def self.run text
        t = self.new
        t.parse text
      end

    end
  end
end
