class ImageSerializer < ActiveModel::Serializer
  attributes :id,
             :dive_id,
             :divesite_id,
             :user_id,
             :thumbnail,
             :medium,
             :standard,
             :original

  def divesite_id
    object.dive.divesite.id
  end

  def user_id
    object.dive.user.id
  end

  def thumbnail
    object.file.url :thumbnail
  end

  def medium
    object.file.url :medium
  end

  def standard
    object.file.url :standard
  end

  def original
    object.file.url
  end
end
