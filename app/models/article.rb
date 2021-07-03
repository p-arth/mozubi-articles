class Article < ApplicationRecord
  validates :title, presence: true
  validates :source, presence: true
end
