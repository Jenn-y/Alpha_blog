class Article < ApplicationRecord

  validates_presence_of :title, :description
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
end