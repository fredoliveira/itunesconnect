if !File.exists?("config.yml")
  puts "Please fill out config.yml before using this tool."
  return
end

puts "Downloading all reports.."
(1..14).each do | days_ago |
  date = (Time.new - 24*60*60 * days_ago).strftime("%Y%m%d")
  system("ruby autoingestion.rb report_date=#{date}")
end
