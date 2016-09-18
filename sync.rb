require 'rubygems'
require 'nokogiri'
require 'mechanize'
require 'active_record'
require 'rest-client'
require 'json'

  ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'w'))
  ActiveRecord::Base.establish_connection(
    #:adapter  => 'sqlite3',
    #:database => 'db/development.sqlite3'
    :adapter  => 'psqlite3g',
    :database => 'db/production.sqlite3'
  )
# 上面請自行更換成你需要的 database adapter

class Park < ActiveRecord::Base

end


#def get_json
    url = 'http://data.tycg.gov.tw/TYCG_OPD/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f;jsessionid=5251A4CFEE3E8993357074A495B31C91?format=json'
    response = RestClient.get(url)
    price_data = JSON.parse(response)
    # 以下為Json格式
    # p JSON.parse(response)
    # p price_data["parkName"]
    # price_data.each do |u|
    #Park.destroy_all
    price_data['result']['records'].each do |u|
        @park = Park.all
        @park.each do |park|
            if park.areaid == u['areaId'].to_s
                #p park.parkname
                #p u['parkName'].to_s
                #p u['surplusSpace'].to_s
                park.surplusspace = u['surplusSpace'].to_s
                park.updatetime = u['updatetime'].to_s
                park.save
            #else
            #  Park.create(
            #      _id: u['_id'].to_s,
            #      parkid: u['parkId'].to_s,
            #      areaid: u['areaId'].to_s,
            #      areaname: u['areaName'].to_s,
            #      parkname: u['parkName'].to_s,
            #      introduction: u['introduction'].to_s,
            #      address: u['address'].to_s,
            #      totalspace: u['totalSpace'].to_s,
            #      surplusspace: u['surplusSpace'].to_s,
            #      payguide: u['payGuide'].to_s,
            #      updatetime: u['updatetime'].to_s,
            #      wgsx: u['wgsX'].to_s,
            #      wgsy: u['wgsY'].to_s
            #  )
            end
        end
    end
#end
#quote = Park.new
#quote.areaname = "aaa"
#quote.save
