require 'httparty'
require 'uri'

module GoogleDork
  def google_dork_search(query)
    user_agent = "Mozilla/5.0 (compatible; RubyDorks/1.0; +https://example.com/rubydorks)"
    dorking_queries = [
      "\"#{query}\" site:linkedin.com",
      "\"#{query}\" intitle:resume OR intitle:CV -jobs -examples",
      "\"#{query}\" filetype:pdf",
      "\"#{query}\" -inurl:(htm|html|php|pls|txt) intitle:index.of \"last modified\" (mp4|wma|aac|avi)",
      "\"#{query}\" inurl:github.com"
    ]

    results = []

    dorking_queries.each do |dork_query|
      encoded_query = URI.encode_www_form_component(dork_query)
      url = "https://www.google.com/search?q=#{encoded_query}"
      response = HTTParty.get(url, headers: {"User-Agent" => user_agent})
      
      # Simulate extracting URLs or relevant information from the response
      # In a real application, you'd parse the response to extract actual data
      results << "Dork query: #{dork_query}"
      results << "Response code: #{response.code}"  # Placeholder
    end

    # Export the results to a text file
    export_results_to_txt(results, query)
  end

  def export_results_to_txt(results, query)
    # Determine the user's home directory
    home_dir = Dir.home
    # Create a filename based on the query and current timestamp
    filename = "dork_results_#{query.gsub(/[^a-zA-Z0-9]/, '_')}_#{Time.now.strftime('%Y%m%d%H%M%S')}.txt"
    # Full path for the file
    file_path = File.join(home_dir, filename)

    # Write the results to the file
    File.open(file_path, 'w') do |file|
      results.each { |line| file.puts(line) }
    end

    puts "Results have been saved to #{file_path}"
  end
end
