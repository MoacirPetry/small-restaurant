# Sprockets 4 registers an autoload for CoffeeScript that calls
# `require 'coffee_script'` when computing asset cache keys.
# Since this app no longer has any .coffee files, we remove the autoload
# and replace it with a stub constant so the gem is never required.
if defined?(Sprockets::Autoload) && Sprockets::Autoload.autoload?(:CoffeeScript)
  Sprockets::Autoload.send(:remove_const, :CoffeeScript)
  module Sprockets
    module Autoload
      module CoffeeScript
        # Sprockets::CoffeeScriptProcessor#cache_key calls Source.version
        module Source
          def self.version
            '0.0.0'
          end
        end
      end
    end
  end
end
