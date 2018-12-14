class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :img_url, :artist, :title, :description
end
