# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /recipes' do
    it 'shows every recipe with a title link, tags (or placeholder when absent), and a description preview' do
      get recipes_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Tofu Saag Paneer with Buttery Toasted Pita')
      expect(response.body).to include(recipe_path('5jy9hcMeEgQ4maKGqIOYW6'))

      expect(response.body).to include('vegan')
      expect(response.body).to include('White Cheddar Grilled Cheese')

      expect(response.body).to include('Saag paneer is a popular Indian dish')
    end
  end

  describe 'GET /recipes/:id' do
    it 'shows title, tags, full description, image, chef, and a way back to the list' do
      get recipe_path('437eO3ORCME46i02SeCW46')

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Crispy Chicken and Rice')
      expect(response.body).to include('gluten free')
      expect(response.body).to include('healthy')
      expect(response.body).to include('Jony Chives')
      expect(response.body).to include('Crispy chicken skin, tender meat, and rich, tomatoey sauce')
      expect(response.body).to include('images.ctfassets.net')
      expect(response.body).to include(recipes_path)
    end

    it 'shows placeholders when chef and tags are absent' do
      get recipe_path('5jy9hcMeEgQ4maKGqIOYW6')

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Tofu Saag Paneer with Buttery Toasted Pita')
      expect(response.body).to include('Chef')
      expect(response.body).to include('Tags')
      expect(response.body).to include('—')
      expect(response.body).to include('images.ctfassets.net')
    end
  end
end
