# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Rails.cache.fetch(index_cache_key, expires_in: 10.minutes) do
      Recipe.search(params[:q]).to_a
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  private

  def index_cache_key
    ['skill_test', 'recipes', 'index', params[:q].to_s.strip]
  end
end
