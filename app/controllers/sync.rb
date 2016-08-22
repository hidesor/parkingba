require 'rest-client'
require 'json'
class SyncData
    p '---start---'
    def get_json
        p '---start---'
        url = 'http://data.tycg.gov.tw/TYCG_OPD/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f;jsessionid=5251A4CFEE3E8993357074A495B31C91?format=json'
        response = RestClient.get(url)
        price_data = JSON.parse(response)
        # 以下為Json格式
        # p JSON.parse(response)
        # p price_data["parkName"]
        #price_data.each do |u|
        price_data["result"]["records"].each do |u|
          #if u["type"].to_s != nil
          p u
          #p u["_id"].to_s
          #end
          #  Park.create(
          #               park_id: u["_id"].to_s
          #  )
        end

    end

end
syncdata = SyncData.new
syncdata.get_json

# http://tech.guojheng-lin.com/posts/2015/12/03/write-a-ruby-file-regularly-to-catch-crawling-web-page-data
