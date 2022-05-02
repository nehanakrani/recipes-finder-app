class Recipe < ActiveRecord::Base
  include PgSearch::Model
  has_many :ingredients, dependent: :destroy

  validates :title, presence: true

  pg_search_scope :search_ingredient,
  associated_against: {
    ingredients: [:name]
  },
  against: :title,
  using: {
    tsearch: {
      dictionary: :english,
      any_word: true,
      prefix: true
    }
  }
end
