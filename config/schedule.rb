every 1.day, :at => '4:20 am' do
  command "cd /root/420_bot && /usr/local/bin/ruby start_bot.rb"
end
every 1.day, :at => '4:20 pm' do
  command "cd /root/420_bot && /usr/local/bin/ruby start_bot.rb"
end
