class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories
  has_many :expenses, through: :expense_categories

  validates :icon, :name, presence: true
end
