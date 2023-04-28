class CategoriesController < ApplicationController
    def index
        @categories = Category.where(author: current_user)
        @expense = Expense.where(author: current_user)
        @expense_categories = ExpenseCategory.all
      end
    
      def new
        @new_category = Category.new
      end
    
      def create
        @create_category = Category.create(create_category_params)
        if @create_category.save
          redirect_to categories_path
        else
          render :new
        end
      end
    
      private
    
      def create_category_params
        params.permit(:name, :icon, :author_id)
      end
end
