require "mongo_mapper"

if ENV["MONGOHQ_URL"]
  uri = URI.parse(ENV['MONGOHQ_URL'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
  MongoMapper.connection = Mongo::Connection.new('localhost')
  MongoMapper.database = "awesomefuckingsongs"
end

class Track
  include MongoMapper::Document
  key :artist, String
  key :track, String
  key :url, String
end
