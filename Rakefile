require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc "This will start a binding.pry"
task :console do 
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  binding.pry
end

