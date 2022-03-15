class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :title, presence: true
  validates :author_id, presence: true

  scope :filter_by_genre, ->(name) { joins(:genres).where(genres: { name: name }) }
  scope :filter_by_start_with, ->(char) { where('title like ?', "#{char}%") }
end
