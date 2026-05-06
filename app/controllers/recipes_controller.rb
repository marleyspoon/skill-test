# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search(params[:q])
  end

  def show
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
