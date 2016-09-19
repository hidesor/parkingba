class Park < ActiveRecord::Base

    geocoded_by :address, :latitude => :wgsy, :longitude => :wgsx

    def self.search(search)
        where('parkname LIKE ?', "%#{search}%")
    end
end
