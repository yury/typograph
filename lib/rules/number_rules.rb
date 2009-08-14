require File.join(File.dirname(__FILE__), '..', 'rule')

class NumberRules < Rule

  def initialize text
    super text

    add :auto_times_x,
        :pattern => /(\d+)(\040*)(x|х)(\040*)(\d+)/u,
        :replacement => '\1&times;\5'

    add :frac_1, # replaces 1/2 and 1/4
        :pattern => /(\D)1\/(2|4)(\D)/,
        :replacement => '\1&frac1\2;\3'

    add :frac_3, # replaces 3/4
        :pattern => /(\D)3\/4(\D)/,
        :replacement => '\1&frac34;\2'
  end

end