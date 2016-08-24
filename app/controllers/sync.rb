require 'rest-client'
require 'json'
class SyncData
  park = Park.new
  park.get_json
end


#syncdata = SyncData.new
#syncdata.get_json

# http://tech.guojheng-lin.com/posts/2015/12/03/write-a-ruby-file-regularly-to-catch-crawling-web-page-data
# https://airsonwayne.gitbooks.io/rocodev-practice-series/content/chapter3-ruby/self.html
