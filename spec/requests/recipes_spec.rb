# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /recipes' do
    it 'shows every recipe with a title link, tags (or placeholder when absent), and a description preview' do
      get recipes_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Tofu Saag Paneer with Buttery Toasted Pita')
      expect(response.body).to include('<a href="#">Tofu Saag Paneer with Buttery Toasted Pita</a>')

      expect(response.body).to include('vegan')
      expect(response.body).to include('White Cheddar Grilled Cheese')

      expect(response.body).to include('Saag paneer is a popular Indian dish')
    end
  end
end
