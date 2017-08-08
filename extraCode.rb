#  Display

accounts.each do |name, info|
  puts "\n"
  puts "======================================================================"
  puts "Account: #{name}... Balance: $#{info[:tally].round(2)}"
  puts "======================================================================"
  puts "Category                     | Total Spent | Average Transaction"
  puts "---------------------------- | ----------- | -------------------------"
  info[:categories].each do |category, c_info|
    print "#{category.ljust(28)} | $#{c_info[:tally].round(2).to_s.ljust(10)} | $#{c_info[:average_transaction_cost].round(2).to_s.ljust(20)}\n"
  end
  puts "\n"
end