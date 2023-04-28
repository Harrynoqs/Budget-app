class Expense < ApplicationRecord
    has_many :expense_categories
    has_many :categories, through: :expense_categories
    belongs_to :author, class_name: 'User'
  
    validates :name, :author_id, presence: true
    validates :amount, numericality: true
end
