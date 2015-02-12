class ImageSerializer < ActiveModel::Serializer
  attributes :id,
             :dive_id,
             :thumbnail,
             :medium,
             :standard,
             :original

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
