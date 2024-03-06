# lib/rubydorks/engines/yahoo_engine.rb

require_relative 'base_engine'
require_relative './dorking_strategies/yahoo_dork'

class YahooEngine < BaseEngine
  include YahooDork

  def search(query)
    yahoo_dork_search(query)
  end
end
