# server.rb
require 'sinatra'
require 'sinatra/json'
require 'json'

posts = [{title: "First Post", body: "how to make an api using (Frank) sinatra"}]

get '/posts' do
  posts.to_json
end

def getBody(req)
  req.body.rewind
  JSON.parse(req.body.read)
end

post '/create-post' do
  body = getBody(req)
  new_post = {title: body["title"], body: body["body"]}
  posts.push(new_post)
  new_post.to_json
end
