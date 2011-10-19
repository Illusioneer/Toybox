require 'rubygems'
require 'mongo'

db = Mongo::Connection.new("localhost").db("test1")
coll = db.collection("articles")

coll.find("pubdate" => "EDT").each { |row| puts row }