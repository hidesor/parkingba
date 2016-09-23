#desc "get Ubike date" # 就可以新增訊息在 rake --tasks 裡面
namespace :devs do
  task :sync => :environment do
    #url = "http://data.tycg.gov.tw/TYCG_OPD/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f;jsessionid=5251A4CFEE3E8993357074A495B31C91?format=json"
    url = "http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json"

    raw_content = RestClient.get(url)
    data = JSON.parse(raw_content )
    data["result"]["records"].each do |u|
          @park = Park.all
          @park.each do |park|
              if park.parkid == u['parkId'].to_s
                  park.surplusspace = u['surplusSpace'].to_s
                  #park.updatetime = Time.now.localtime.to_formatted_s(:db).to_s
                  park.updatetime = Time.zone.local.to_formatted_s(:db).to_s
                  park.save
              end
          end
    end
    p 'sync finish'
    p Time.zone.local.to_formatted_s(:db).to_s
  end
end
