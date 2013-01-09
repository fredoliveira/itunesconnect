task :default => [:clean, :rspec]

task :clean do
  puts ":clean.."
  system("rm *.txt.gz > /dev/null 2>&1")
  system("rm *txt *txt.gz > /dev/null 2>&1")
end

task :rspec do
  puts ":rspec.."
  system("rspec autoingestion_spec.rb")
end


