# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application boot' do
  it 'loads the Rails environment' do
    expect(Rails.application).to be_a(Rails::Application)
  end
end
