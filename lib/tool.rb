require "strscan"

class String
  def sub_each regex, &block
    return unless block_given?
    scanner = StringScanner.new self
    while scanner.scan(regex)
      pre_match = scanner.pre_match
      replacement = block[scanner]
      new_pos = pre_match.length + replacement.length
      scanner.string = pre_match << replacement << scanner.post_match
      scanner.pos = new_pos
    end
    scanner.string
  end

  def sub_each! regex, &block
    self.replace(self.sub_each(regex, &block))
  end
end


class Tool

  @@chars_table = {
        '"' => ['&laquo;', '&raquo;', '&ldquo;', '&lsquo;', '&bdquo;', '&ldquo;', '&quot;', '&#171;', '&#187;','�', '�', '�', '�', '�'],
		' ' => ['&nbsp;', '&thinsp;'],
		'-' => ['&mdash;', '&ndash;', '&minus;', '&#151;', '�', '&#8212;', '&#8211;'],
		'==' => ['&equiv;'],
		'...' => ['&hellip;'],
		'!=' => ['&ne;', '&#8800;'],
		'<=' => ['&le;', '&#8804;'],
		'>=' => ['&ge;', '&#8805;'],
		'1/2' => ['&frac12;'],
		'1/4' => ['&frac14;'],
		'3/4' => ['&frac34;'],
		'+-' => ['&plusmn;', '&#177;'],
		'&' => ['&amp;'],
		'(tm)' => ['&trade;'],
		'(r)' => ['&reg;'],
		'(c)' => ['&copy;', '&#169;', '�'],
		'`' => ['&#769;'],
		'\'' => ['&rsquo;', '�']
  }
end