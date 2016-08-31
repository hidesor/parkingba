#desc "get Ubike date" # 就可以新增訊息在 rake --tasks 裡面
namespace :dev do
  task :fetch_ubike => :environment do
    url = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ddb80380-f1b3-4f8e-8016-7ed9cba571d5"
    raw_content = RestClient.get(url)
    data = JSON.parse( raw_content )
    data["result"]["results"].each do |u|
      a = Ubike.find_by_ubike_id( u["_id"] )
      if a == nil
        Ubike.create( :ubike_id => u["_id"], :name => u["sna"])
      else
        a.update( :ubike_id => u["_id"], :name => u["sna"])
      end
    end
  end
end
