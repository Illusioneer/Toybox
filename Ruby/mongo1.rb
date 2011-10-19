require 'rubygems'
require 'mongo'
require 'faker'

db = Mongo::Connection.new("localhost").db("test1")
#db.collection_names.each { |name| puts name }
coll = db.collection("articles")

1000.times do
  
  doc = {"article" => Faker::Name.name,"content" => Faker::Lorem.sentences(20),"pubdate" => Time.now, }
  coll.insert(doc)
end

