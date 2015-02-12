class DiveSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :divesite_id, :date

  has_many :images
end
