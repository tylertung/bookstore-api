class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :rates
  belongs_to :author
  has_many :genres
  has_many :comments

  def rates
    rates = Rate.joins(:book).where({ book: { id: object.id } }).count
    if rates < 5
      rates
    else
      (rates.to_f / 5).round(1)
    end
  end
end
