require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  describe 'expenses index' do
    before(:each) do
      get category_expenses_path(1)
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns a list of expenses' do
      expect(response.body).to include('Add new Transaction')
    end

    it 'render index action' do
      expect(response).to render_template(:index)
    end
  end
end
