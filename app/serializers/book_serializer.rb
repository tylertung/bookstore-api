class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :author
  has_many :genres
  has_many :comments
  has_many :rates

end
