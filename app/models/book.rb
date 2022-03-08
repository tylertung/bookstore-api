class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres

  validates :title, presence: true
  validates :author_id, presence: true

  scope :filter_by_genre, ->(genre) { where name: genre }
  scope :start_with, ->(char) { where('title like ?', "#{char}%") }
end
