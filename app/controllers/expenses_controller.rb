class ExpensesController < ApplicationController
  def index
    @categories = Category.find_by(id: params[:category_id])
    @expenses = ExpenseCategory.includes(:expense).where(category: @categories).order(created_at: :desc)
    @total_expenses = @expenses.map { |expenditure| expenditure.expense.amount }.sum
  end

  def new
    @new_expense = Expense.new
    @categories = Category.where(author: current_user)
  end

  def create
    @create_expense = Expense.create(name: params[:name], amount: params[:amount], author: current_user)
    if @create_expense
      @new_expense_category = ExpenseCategory.create(expense_id: @create_expense.id,
                                                     category_id: params[:category_id])
      redirect_to categories_path
    else
      render :new
    end
  end
end
