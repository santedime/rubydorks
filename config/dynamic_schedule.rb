set :output, 'cron.log'
every '0 5 * * *' do
  command "cd /home/sante/Projects/RubyDorks && ruby main.rb -q 'software engineer' -e 'google,bing'"
end
