class EnquirySerializer < ActiveModel::Serializer
  attributes :id, :user, :name, :topic, :message, :created_at

  def user
    object.user.username 
  end

  def topic
    object.topic.name
  end
end
