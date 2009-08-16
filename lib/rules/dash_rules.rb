require File.expand_path(File.join(File.dirname(__FILE__), '..', 'rule'))

class DashRules < Rule

  def initialize
    super
    
    add :m_dash,
        :pattern => /([a-zа-я0-9]+|,|:|\)|&raquo;|\|")(\040|\t)(\-|&mdash;)(\s|$|<)/u,
        :replacement => '\1&nbsp;&mdash;\4'

    add :m_dash_2,
        :pattern => /(\n|\r|^|>)(\-|&mdash;)(\t|\040)/,
        :replacement => '\1&mdash;&nbsp;'

    add :m_dash_3,
        :pattern => /(\.|!|\?|&hellip;)(\040|\t|&nbsp;)(\-|&mdash;)(\040|\t|&nbsp;)/,
        :replacement => '\1 &mdash;&nbsp;'
    
    add :years,
        :pattern => /(с|по|период|середины|начала|начало|конца|конец|половины|в|между)(\s+|&nbsp;)([\d]{4})(-)([\d]{4})(г|гг)?/eui,
        :replacement => lambda {|m| "#{m[1]}#{m[2]}#{build_years(m[3],m[5],m[4])}#{m[6]}"  }

    add :iz_za_pod,
        :pattern => /(\s|&nbsp;|>)(из)(\040|\t|&nbsp;)\-?(за|под)([\.,!\?:;]|\040|&nbsp;)/uie,
        :replacement => lambda {|m| "#{m[1] == NBSP ? " " : m[1]}#{m[2]}-#{m[4]}#{m[5] == NBSP ? " " : m[5]}" }

    add :to_libo_nibud,
        :pattern => /(\s|^|&nbsp;|>)(кто|кем|когда|зачем|почему|как|что|чем|где|чего|кого)\-?(\040|\t|&nbsp;)\-?(то|либо|нибудь)([\.,!?;]|\040|&nbsp;|$)/ui,
        :replacement => lambda {|m| "#{m[1] == NBSP ? " " : m[1]}#{m[2]}-#{m[4]}#{m[5] == NBSP ? " " : m[5]}" }
  end

  def build_years start_date, end_date, sep
    start_date = start_date.to_i
    end_date = end_date.to_i
    start_date >= end_date ? "#{start_date}#{sep}#{end_date}" : "#{start_date}&ndash;#{end_date}"
  end
end