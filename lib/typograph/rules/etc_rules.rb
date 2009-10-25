# encoding: utf-8

module Typograph
  module Rules

    class EtcRules < Rule

      def initialize
        super
        add :tm_replace,
            :pattern => /([\040\t])?\(tm\)/i,
            :replacement => '&trade;'

        # TODO: encrypted tags
        #add :r_sign_replace,
        #    :pattern => /\(r\)/ei


        add :copy_replace,
            :pattern => /\((c|с)\)\s+/iu,
            :replacement => '&copy;&nbsp;'

        add :acute_accent,
            :pattern => /(у|е|ы|а|о|э|я|и|ю|ё)`(\w)/iu,
            :replacement => '\1&#769;\2'

        #add :auto_links

      end

    end
  end
end
