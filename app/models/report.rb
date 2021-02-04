class Report < ApplicationRecord
  belongs_to :user
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :format
  belongs_to :category

  validates :format_id, :category_id, :title, :headline, :text, :date, presence: true
  validates :format_id, :category_id, numericality: { other_than: 1 } 

end
