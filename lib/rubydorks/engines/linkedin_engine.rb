# lib/rubydorks/engines/linkedin_engine.rb

require_relative 'base_engine'
require_relative './dorking_strategies/linkedin_dork'

class LinkedInEngine < BaseEngine
  include LinkedInDork

  def search(query)
    linkedin_dork_search(query)
  end
end
