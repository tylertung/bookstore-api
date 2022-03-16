class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :rate
  belongs_to :author
  has_many :genres
  has_many :comments
  has_many :rates

  def rate
    Book.find(object.id).rates.average(:quantity).to_f
  end
end
