class RateSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :book_id, :user_id
end
