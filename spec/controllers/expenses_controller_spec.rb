require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe 'GET #index' do
    let(:category) { create(:category) }

    before do
      get :index, params: { category_id: category.id }
    end

    it 'assigns the categories' do
      expect(assigns(:categories)).to eq(category)
    end

    it 'assigns the expenses' do
      expect(assigns(:expenses)).not_to be_empty
    end

    it 'assigns the total expenses' do
      expect(assigns(:total_expenses)).to eq(assigns(:expenses).sum(&:amount))
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'assigns the new expense' do
      expect(assigns(:new_expense)).to be_a_new(Expense)
    end

    it 'assigns the categories' do
      expect(assigns(:categories)).not_to be_empty
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:category) { create(:category) }

    context 'with valid params' do
      before do
        post :create, params: { name: 'Expense', amount: 10, category_id: category.id }
      end

      it 'creates a new expense' do
        expect(Expense.count).to eq(1)
      end

      it 'creates a new expense category' do
        expect(ExpenseCategory.count).to eq(1)
      end

      it 'redirects to the categories path' do
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid params' do
      before do
        post :create, params: { name: '', amount: 10, category_id: category.id }
      end

      it 'does not create a new expense' do
        expect(Expense.count).to eq(0)
      end

      it 'does not create a new expense category' do
        expect(ExpenseCategory.count).to eq(0)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end
  end
end
