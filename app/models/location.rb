# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#
class Location < ActiveRecord::Base
  geocoded_by :address do |obj,results|
    if geo = results.first
      obj.address = geo.address
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  after_validation :geocode, :if => :address_changed?
end
