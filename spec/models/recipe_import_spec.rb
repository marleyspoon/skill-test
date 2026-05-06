# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipe import', type: :model do
  describe '.import_from_fixture!' do
    it 'rebuilds the recipes table from config/data/response.json' do
      Recipe.delete_all
      expect(Recipe.count).to eq(0)

      Recipe.import_from_fixture!

      expect(Recipe.count).to eq(4)
      tofu = Recipe.find('5jy9hcMeEgQ4maKGqIOYW6')
      expect(tofu.title).to include('Tofu Saag Paneer')
      expect(tofu.tags_list).to be_nil
    end
  end
end
