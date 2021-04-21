# frozen_string_literal: true

require_relative 'config/boot.rb'

class CookBook < Sinatra::Base
  configure do 
    # Make Contentful Available to all endpoints
    set :client, -> { Contentful::Client.new(
        space: ENV['CONTENTFUL_SPACE'],
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        api_url: 'cdn.contentful.com',
        environment: ENV["CONTENTFUL_ENVIRONMENT"],
        entry_mapping: {
          'recipe' => DataTypes::Recipe
        },
      ) }
  end

  # Set reponse headers to json to all endpoints
  # 
  before do
    content_type :json
  end

  # Renders a Not Found page as root page
  # 
  # @raises (Sinatra::NotFound) Page Not Found
  #
  get '/' do 
    raise Sinatra::NotFound
  end

  # Returns a list of Recipes
  # 
  # @returns (String) Endpoint response json
  # 
  get '/recipes' do
    settings.client.entries(content_type: 'recipe').map(&:as_hash).to_json
  end

  # Returns a single Recipe
  # 
  # @returns (String) Endpoint response json
  # 
  get '/recipes/:id' do
    settings.client.entry(params[:id]).as_hash.to_json
  end
end
