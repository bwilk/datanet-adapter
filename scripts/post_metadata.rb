require 'uri'
require 'net/http'
require 'json'
require './processing.rb'

collection_url = ARGV[0] || "http://process.cyfronet.pl:8080/datanet/metadata-col-2"

url = URI(collection_url)

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = "Basic #{ENV['AUTH']}"
request["cache-control"] = 'no-cache'

processing = Processing.new
processing.perform

body = JSON.generate(processing.metadata)
request.body = body 

response = http.request(request)
puts response.code

if response.code == "201"

	puts body

end
