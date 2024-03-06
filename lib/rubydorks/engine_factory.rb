# Ensure all engine classes are required
require_relative 'engines/google_engine'
require_relative 'engines/bing_engine'
require_relative 'engines/yahoo_engine'
require_relative 'engines/ask_engine'
require_relative 'engines/linkedin_engine'
# Add other engine requires as needed

class EngineFactory
  def self.create(engine_name)
    case engine_name.downcase
    when 'google'
      GoogleEngine.new
    when 'bing'
      BingEngine.new
    when 'yahoo'
      YahooEngine.new
    when 'ask'
      AskEngine.new
    when 'linkedin'
      LinkedInEngine.new
    # Add cases for other engines as implemented
    else
      raise "Unknown engine: #{engine_name}"
    end
  end
end
