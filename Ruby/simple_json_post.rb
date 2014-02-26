require 'json'
require 'net/http'
require 'uri'

uri = URI.parse("http://dropbox.hcpprod.com/zabbix/api_jsonrpc.php")

datum = JSON.parse('{"jsonrpc":"2.0","method":"user.login","params":{"user":"Admin","password":"zabbix"},"id":1}')

headers = JSON.parse('{"Content-Type":"application/json"}')

http = Net::HTTP.new(uri.host,uri.port)   
response = http.post(uri.path,datum,headers)
puts response.code
puts response.body