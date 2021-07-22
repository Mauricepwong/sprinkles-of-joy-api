class CakeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :name, :description, :ingredients, :image

  def image
    object.image.url.sub(/\?.*/, '') 
  end
  #   return unless object.image.attached?

  #   object.image.blob.attributes
  #         .slice('filename', 'byte_size')
  #         .merge(url: image_url)
  #         .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  # end

  # def image_url
  #   rails_blob_url(object.image, only_path: true) 
  # end
end

