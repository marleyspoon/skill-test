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

  describe '#chef_label' do
    it 'returns an em dash when chef is missing' do
      recipe = Recipe.new('id' => '1', 'title' => 'T', 'chef_name' => nil, 'description' => '')
      expect(recipe.chef_label).to eq('—')
    end

    it 'returns the trimmed name when present' do
      recipe = Recipe.new('id' => '1', 'title' => 'T', 'chef_name' => '  Pat  ', 'description' => '')
      expect(recipe.chef_label).to eq('Pat')
    end
  end

  describe '.search' do
    let(:apple) do
      Recipe.new('id' => '1', 'title' => 'Apple Pie', 'description' => 'A tart dessert', 'tags_list' => %w[dessert sweet],
                  'chef_name' => nil)
    end
    let(:steak) do
      Recipe.new('id' => '2', 'title' => 'Steak Dinner', 'description' => 'Grilled beef', 'tags_list' => %w[dinner],
                  'chef_name' => nil)
    end
    let(:soup) do
      Recipe.new('id' => '3', 'title' => 'Soup', 'description' => 'Hot bowl', 'tags_list' => [], 'chef_name' => 'Pat Smith')
    end

    before { allow(Recipe).to receive(:all).and_return([apple, steak, soup]) }

    it 'returns every recipe when the query is blank or whitespace' do
      expect(Recipe.search(nil).map(&:id)).to contain_exactly('1', '2', '3')
      expect(Recipe.search('').map(&:id)).to contain_exactly('1', '2', '3')
      expect(Recipe.search('   ').map(&:id)).to contain_exactly('1', '2', '3')
    end

    it 'matches title, description, tags, or chef name case-insensitively' do
      expect(Recipe.search('steak').map(&:id)).to eq(['2'])
      expect(Recipe.search('DESSERT').map(&:id)).to eq(['1'])
      expect(Recipe.search('beef').map(&:id)).to eq(['2'])
      expect(Recipe.search('smith').map(&:id)).to eq(['3'])
    end
  end
end
