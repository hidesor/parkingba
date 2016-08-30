namespace :STOCK do

  desc  "go to lookup quote data from yahoo finance tw"
  task :get_stock_price do
  # the ruby file's path is in the project root, the file should be placed in there
  ruby "sync.rb"
  end

end
