require_relative 'base_engine'
require_relative './dorking_strategies/ask_dork'

class AskEngine < BaseEngine
  include AskDork

  def search(query)
    ask_dork_search(query)
  end
end
