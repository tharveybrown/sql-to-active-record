require 'bundler'
Bundler.require

require_all 'models'

CONN = SQLite3::Database.new("rideshare.db")
CONN.results_as_hash = true

