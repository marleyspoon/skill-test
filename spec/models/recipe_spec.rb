# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#tags_label' do
    it 'returns an em dash when tags are missing' do
      recipe = Recipe.new('id' => '1', 'title' => 'T', 'tags_list' => nil, 'description' => '')
      expect(recipe.tags_label).to eq('—')
    end

    it 'joins present tags' do
      recipe = Recipe.new('id' => '1', 'title' => 'T', 'tags_list' => %w[vegan quick], 'description' => '')
      expect(recipe.tags_label).to eq('vegan, quick')
    end
  end
end
