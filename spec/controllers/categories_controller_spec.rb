require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  describe 'categories index' do
    before(:each) do
      get '/categories'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns a list of categories' do
      expect(response.body).to include('Add new Category')
    end
  end
end
