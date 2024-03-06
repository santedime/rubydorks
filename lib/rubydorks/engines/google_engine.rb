require_relative 'base_engine'
require_relative './dorking_strategies/google_dork'

class GoogleEngine < BaseEngine
  include GoogleDork

  def search(query)
    google_dork_search(query)
  end
end
