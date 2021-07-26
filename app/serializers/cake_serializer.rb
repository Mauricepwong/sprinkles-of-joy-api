class CakeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :name, :description, :ingredients, :price, :image

  def image
    if object.image.attached?
      object.image.url.sub(/\?.*/, '') 
    end
  end
end

