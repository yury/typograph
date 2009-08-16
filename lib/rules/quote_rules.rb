require File.expand_path(File.join(File.dirname(__FILE__), '..', 'rule'))

class QuoteRules < Rule

  QUOTE_FIRS_OPEN = '&laquo;';
  QUOTE_FIRS_CLOSE = '&raquo;';
  QUOTE_CRAWSE_OPEN = '&bdquo;';
  QUOTE_CRAWSE_CLOSE = '&ldquo;';

  def initialize
    super
    
    add :quotes_outside_a,
        :pattern => /(<%%__.+?>)"(.+?)"(<\/%%__.+?>)/s,
        :replacement => '"\1\2\3"'

    add :open_quote,
        :pattern => /(^|\(|\s)("|\\")(\S+)/iue,
        :replacement => "\\1#{QUOTE_FIRS_OPEN}\\3"

    add :close_quote,
        :pattern => /([a-zа-я0-9]|\.|&hellip;|!|\?)("|\\")+(\.|&hellip;|;|:|\?|!|,|\s|\)|<\/|$)/uie,
        :replacement => "\\1#{QUOTE_FIRS_CLOSE}\\3"
  end

end