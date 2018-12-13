# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'sinatra'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app/controllers/application_controller.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
