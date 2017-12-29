class MessageSerializer < ActiveModel::Serializer
  attributes :id, :originator, :recipient, :content, :status
end
