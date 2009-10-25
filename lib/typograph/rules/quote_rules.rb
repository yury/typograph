# encoding: utf-8

module Typograph
  module Rules

    class QuoteRules < Rule

      def initialize
        super

        add :quotes_outside_a,
            :pattern => /(<%%__.+?>)"(.+?)"(<\/%%__.+?>)/m,
            :replacement => '"\1\2\3"'

        add :open_quote,
            :pattern => /(^|\(|\s)("|\\")(\S+)/i,
            :replacement => "\\1#{QUOTE_FIRS_OPEN}\\3"

        add :close_quote,
            :pattern => /([a-zа-я0-9]|\.|&hellip;|!|\?)("|\\")+(\.|&hellip;|;|:|\?|!|,|\s|\)|<\/|$)/i,
            :replacement => "\\1#{QUOTE_FIRS_CLOSE}\\3"
      end

    end
  end
end
