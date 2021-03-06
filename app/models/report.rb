class Report < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :format
  belongs_to :category

  validates :format_id, :category_id, :title, :headline, :text, :date, presence: true
  validates :title, length: { maximum: 15 }
  validates :headline, length: { maximum: 140 }
  validates :text, length: { maximum: 1000 }
  validates :format_id, :category_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ''
      Report.where('text LIKE(?)', "%#{search}%")
    else
      Report.all
    end
  end
end
