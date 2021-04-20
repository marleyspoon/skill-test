# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader' 


class CookBook < Sinatra::Base
	get '/' do
	  'Installing Sinatra' 
	end
end
