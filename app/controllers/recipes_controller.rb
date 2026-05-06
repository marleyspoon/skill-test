# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search(params[:q])
  end

  def show
    @recipe = Recipe.find(params[:id])
    return head :not_found if @recipe.nil?
  end
end
