require File.expand_path(File.join(File.dirname(__FILE__), '..', 'rule'))

class PunchmarkRules < Rule

  def initialize
    super
    
    add :auto_comma,
        :pattern => /([a-zа-я])(\s|&nbsp;)(но|а)(\s|&nbsp;)/iu,
        :replacement =>  '\1,\2\3\4'

    add :punctuation_marks_limit,
        :pattern => /([!.?]){4,}/,
        :replacement => '\1\1\1'

    add :punctuation_marks_base_limit,
        :pattern => /([,:;]){2,}/,
        :replacement => '\1'

    add :hellip,
        :pattern => /\.\.+/,
        :replacement => '&hellip;'

    add :eng_apostrophe,
        :pattern => /(\s|^|>)([a-z]{2,})'([a-z]+)/i,
        :replacement => '\1\2&rsquo;\3'

    add :fix_pmarks,
        :pattern => /([a-zа-я0-9])(!|\.|\?){2}(\s|$|<)/iu,
        :replacement => '\1\2\3'

    add :fix_l_bracket,
        :pattern => /(\()(\040|\t)+/,
        :replacement => '\1'

    add :fix_r_bracket,
        :pattern => /(\040|\t)+(\))/,
        :replacement => '\2'

  end

end