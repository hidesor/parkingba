class Park < ActiveRecord::Base
    def self.search(search)
        where('parkname LIKE ?', "%#{search}%")
    end
end
