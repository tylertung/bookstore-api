class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :author
  has_many :genres

end
