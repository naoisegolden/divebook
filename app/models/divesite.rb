# == Schema Information
#
# Table name: divesites
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Divesite < ActiveRecord::Base
  has_many :dives, class_name: 'Dive'
  has_many :images, through: :dives
  has_many :users, through: :dives

  geocoded_by :address

  validates :address, presence: true

  after_validation :geocode, if: :address_changed?
end
