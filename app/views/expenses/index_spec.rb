RSpec.describe ExpensesController, type: :system do
  describe 'expense index view' do
    before(:each) do
      @user_one = User.create(name: 'user_one')

      @category_one = Category.create(name: 'category_one', icon: 'icon_one')
      @category_two = Category.create(name: 'category_two', icon: 'icon_two')

      @expense_one = Expense.create(name: 'Expense_one', amount: 100)
      @expense_two = Expense.create(name: 'Expense_two', amount: 200)

      visit category_expenses_path(1)
    end

    it 'shows all transactions' do
      expect(page).to have_content('Add new Transaction')
    end

    it 'open a new transaction form' do
      click_on 'Add new Transaction'
      expect(page).to have_content('Name')
    end
  end
end
