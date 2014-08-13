class Restaurant < ActiveRecord::Base
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews

  validates :name,
    presence: true

  validates :address,
    presence: true

  validates :category,
    inclusion: { in: CATEGORIES }
end
