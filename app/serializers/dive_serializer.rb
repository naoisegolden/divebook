class DiveSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :divesite_id, :date
end
