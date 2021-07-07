class Article < ApplicationRecord
  include PgSearch::Model
  validates :title, presence: true
  validates :source, presence: true
  validates_format_of :source, with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix

  pg_search_scope :search_by_title_and_body,
                  against: [:title, :body],
                  using: {
                    tsearch: { prefix: true },                   
                  }

end
