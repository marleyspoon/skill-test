# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes index caching', type: :request do
  around do |example|
    previous_cache = Rails.cache
    previous_perform = Rails.application.config.action_controller.perform_caching
    Rails.application.config.action_controller.perform_caching = true
    Rails.cache = ActiveSupport::Cache::MemoryStore.new
    example.run
  ensure
    Rails.application.config.action_controller.perform_caching = previous_perform
    Rails.cache = previous_cache
  end

  it 'calls Recipe.search only once for two identical list requests' do
    allow(Recipe).to receive(:search).and_call_original

    get recipes_path, params: { q: 'chicken' }
    get recipes_path, params: { q: 'chicken' }

    expect(Recipe).to have_received(:search).once
  end
end
