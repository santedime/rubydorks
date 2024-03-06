require 'httparty'
require 'uri'

module YahooDork
  def yahoo_dork_search(query)
    user_agent = "Mozilla/5.0 (compatible; RubyDorks/1.0; +https://example.com/rubydorks)"
    dorking_queries = [
      "\"#{query}\" site:linkedin.com",
      "\"#{query}\" intitle:resume OR intitle:CV -jobs -examples",
      "\"#{query}\" filetype:pdf",
      "\"#{query}\" -inurl:(htm|html|php) intitle:index.of \"last modified\" (pdf|doc)",
      "\"#{query}\" inurl:profiles"
    ]

    results = []

    dorking_queries.each do |dork_query|
      encoded_query = URI.encode_www_form_component(dork_query)
      url = "https://search.yahoo.com/search?p=#{encoded_query}"
      response = HTTParty.get(url, headers: {"User-Agent" => user_agent})
      
      # Store the dork query and response code for demonstration
      results << "Dork query: #{dork_query}"
      results << "Response code: #{response.code}"  # Placeholder
    end

    # Export the results to a text file
    export_results_to_txt(results, query)
  end

  private

  def export_results_to_txt(results, query)
    home_dir = Dir.home
    filename = "yahoo_dork_results_#{query.gsub(/[^a-zA-Z0-9]/, '_')}_#{Time.now.strftime('%Y%m%d%H%M%S')}.txt"
    file_path = File.join(home_dir, filename)

    File.open(file_path, 'w') do |file|
      results.each { |line| file.puts(line) }
    end

    puts "Results have been saved to #{file_path}"
  end
end
