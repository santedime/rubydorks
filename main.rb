require 'optparse'
require 'fileutils'
require 'whenever'
require_relative 'lib/rubydorks/engine_factory'

# ASCII Art for "Ruby Dorks"
puts <<-ASCIIART
   ___       __          ___           __      
  / _ \__ __/ /  __ __  / _ \___  ____/ /__ ___
 / , _/ // / _ \/ // / / // / _ \/ __/  '_/(_-<
/_/|_|\_,_/_.__/\_, / /____/\___/_/ /_/\_\/___/
               /___/                                                 

ASCIIART

puts "Welcome to Ruby Dorks version 1.0"

# Help and Command Functionalities
options = { engines: [], schedule: false }
OptionParser.new do |opts|
  opts.banner = "Usage: main.rb [options]"

  opts.on("-qQUERY", "--query=QUERY", "Search query") do |query|
    options[:query] = query
  end

  opts.on("-eENGINES", "--engines=ENGINES", "Comma-separated list of search engines (e.g., google,bing)") do |engines|
    options[:engines] = engines.split(',')
  end

  opts.on("-s", "--schedule TIME", "Schedule a cron job (e.g., '0 5 * * *' for every day at 5 AM)") do |time|
    options[:schedule] = time
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

# Define the path for the dynamic schedule file
dynamic_schedule_path = File.join(File.dirname(__FILE__), 'config', 'dynamic_schedule.rb')

# Schedule logic
if options[:schedule]
  job_command = "cd #{Dir.pwd} && ruby #{__FILE__} -q '#{options[:query]}' -e '#{options[:engines].join(',')}'"
  
  # Generate the dynamic schedule file with the user-defined job
  File.open(dynamic_schedule_path, 'w') do |file|
    file.puts "set :output, 'cron.log'"
    file.puts "every '#{options[:schedule]}' do"
    file.puts "  command \"#{job_command}\""
    file.puts "end"
  end

  # Use Whenever to update the crontab using the dynamic schedule file
  Whenever::CommandLine.execute(command: 'update', file: dynamic_schedule_path)
else
  # Validate required options for immediate search
  raise OptionParser::MissingArgument.new("query") if options[:query].nil?
  raise OptionParser::MissingArgument.new("engines") if options[:engines].empty?

  # Conduct searches based on user input
  options[:engines].each do |engine_name|
    begin
      engine = EngineFactory.create(engine_name)
      results = engine.search(options[:query])
    rescue => e
      puts "Error with #{engine_name}: #{e.message}"
    end
  end
end
