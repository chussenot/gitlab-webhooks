require "json"
require "http/server"
require "gitlab-webhooks"

server = HTTP::Server.new do |context|
  if body = context.request.body
    event : Gitlab::Event = Gitlab.event_from(JSON.parse(body).to_json.to_s)
    puts event.commit.message
    context.response.content_type = "text/plain"
    context.response.print "Hello world!"
  else
    context.response.print "You didn't POST any data :("
  end
end

server.bind_tcp 8080
puts "Listening on http://0.0.0.0:8080"
server.listen

# Then you can curl the server with a sample file
# curl -X POST --data @data.json http://localhost:8080/
