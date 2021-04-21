# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'zeitwerk'
require 'contentful' 
require 'pry' unless ENV["RACK_ENV"] == "production"

# Load application modules
loader = Zeitwerk::Loader.new
loader.push_dir(File.expand_path('../app', __dir__))
loader.setup

