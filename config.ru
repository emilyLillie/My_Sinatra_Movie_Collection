require './config/environment'
require 'sinatra'
require_relative './app/controllers/application_controller'
# require_relative '.app/controllers/login_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride


use LoginController 
use MovieController
run ApplicationController

