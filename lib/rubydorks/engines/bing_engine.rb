require_relative 'base_engine'
require_relative './dorking_strategies/bing_dork'

class BingEngine < BaseEngine
  include BingDork

  def search(query)
    bing_dork_search(query)
  end
end
