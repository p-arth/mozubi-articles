class Article < ApplicationRecord
  include PgSearch::Model
  validates :title, presence: true
  validates :source, presence: true

  pg_search_scope :search_by_title_and_body,
                  against: [:title, :body],
                  using: {
                    tsearch: { prefix: true },                   
                  }

end
