class DivesiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :latitude, :longitude, :dives

  def dives
    object.dives.count
  end
end
