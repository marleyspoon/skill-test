# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#tags_label' do
    it 'returns an em dash when tags are missing' do
      recipe = Recipe.new(id: '1', title: 'T', tags_list: nil, description: '')
      expect(recipe.tags_label).to eq('—')
    end

    it 'joins present tags' do
      recipe = Recipe.new(id: '1', title: 'T', tags_list: %w[vegan quick], description: '')
      expect(recipe.tags_label).to eq('vegan, quick')
    end
  end

  describe '#chef_label' do
    it 'returns an em dash when chef is missing' do
      recipe = Recipe.new(id: '1', title: 'T', chef_name: nil, description: '')
      expect(recipe.chef_label).to eq('—')
    end

    it 'returns the trimmed name when present' do
      recipe = Recipe.new(id: '1', title: 'T', chef_name: '  Pat  ', description: '')
      expect(recipe.chef_label).to eq('Pat')
    end
  end

  describe '.search' do
    it 'returns every recipe when the query is blank or whitespace' do
      expect(Recipe.search(nil).count).to eq(4)
      expect(Recipe.search('').count).to eq(4)
      expect(Recipe.search('   ').count).to eq(4)
    end

    it 'matches title, description, tags, or chef name case-insensitively' do
      expect(Recipe.search('chicken').map(&:id)).to eq(['437eO3ORCME46i02SeCW46'])
      expect(Recipe.search('VEGAN').map(&:id)).to eq(['4dT8tcb6ukGSIg2YyuGEOm'])
      expect(Recipe.search('tomatoey').map(&:id)).to eq(['437eO3ORCME46i02SeCW46'])
      expect(Recipe.search('zucchiniberg').map(&:id)).to eq(['2E8bc3VcJmA8OgmQsageas'])
    end
  end
end
