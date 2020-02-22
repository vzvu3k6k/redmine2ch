# frozen_string_literal: true

module Datpot
  module Refinements
    module String
      refine ::String do
        def escape_dat
          gsub(/<|>/, '<' => '&lt;', '>' => '&gt;')
            .gsub("\n", '<br>')
        end
      end
    end
  end
end
