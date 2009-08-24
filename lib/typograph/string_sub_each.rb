require "strscan"

class String
  def sub_each regexp, &block
    return unless block_given?
    scanner = StringScanner.new self
    while scanner.scan(regexp)
      pre_match = scanner.pre_match
      replacement = block[scanner]
      new_pos = pre_match.length + replacement.length
      scanner.string = pre_match << replacement << scanner.post_match
      scanner.pos = new_pos
    end
    scanner.string
  end

  def sub_each! regexp, &block
    self.replace(self.sub_each(regexp, &block))
  end
end