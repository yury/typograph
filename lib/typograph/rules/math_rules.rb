# encoding: utf-8

module Typograph
  module Rules

    class MathRules < Rule

      def initialize
        super

        add :auto_times_x,
            :pattern => /(\d+)(\040*)(x|х)(\040*)(\d+)/u,
            :replacement => '\1&times;\5'

        add :frac_1, # replaces 1/2 and 1/4
            :pattern => /(\D)1\/(2|4)(\D)/,
            :replacement => '\1&frac1\2;\3'

        add :frac_3, # replaces 3/4
            :pattern => /(\D)3\/4(\D)/,
            :replacement => '\1&frac34;\2'

        add :not_equal,
            :pattern => /!=/,
            :replacement => '&#8800;'

        add :plus_minus,
            :pattern => /\+-/,
            :replacement => '&plusmn;'

      end

    end
  end
end
