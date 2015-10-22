require 'sinatra'
require 'slim'

get "/home" do
  $blog_posts.each_with_index do |post, i|

  slim <<-HOMEVIEW
doctype html
html
  head
    title My Blog - Home Page
  body
    - $blog_posts.each_with_index do |post, i|
      div id="post-title#{i}"
        = post['title']
      div id="post-author#{i}"
        = post['author']
      div id="post-date#{i}"
        = post['date']
      div id="post-content#{i}"
        = post['content']
      div id="post-link#{i}"
    a href='/create' id='create-link' Create a Post
HOMEVIEW
end

get "/read" do
  slim <<-READVIEW
doctype html
html
  head
    title My Blog - Read Page
  body
    div id='post-title'
      =params[:title]
    div id='post-author'
      =params[:author]
    div id='post-date'
      =params[:date]
    div id='post-content'
      =params[:content]
    a href='/delete' id='delete-link' Delete this Post
READVIEW
end

get "/create" do
  slim <<-CREATEVIEW
doctype html
html
  head
    title My Blog - Create
  body
    a href='/home' id='home-link' Home Page
    form action='/read' method='POST'
      input type='text' id='post-title' name='title'
      input type='text' id='post-author' name='author'
      input type='text' id='post-date' name='date'
      textarea id='post-content' name='content'
      button type='submit' id='submit-post' Submit
CREATEVIEW
end

post '/read' do
  $blog_posts ||= []
  if $blog_posts.any?{ |hash| hash["title"] == params[:title]}
  	"Error! No duplicate titles!"
  else
    $blog_posts.push({ "title" => params[:title], "author" => params[:author], "date" => params[:date], "content" => params[:content]})
    slim <<-READVIEW
doctype html
html
  head
    title My Blog - Read Page
  body
    div id='post-title'
      =params[:title]
    div id='post-author'
      =params[:author]
    div id='post-date'
      =params[:date]
    div id='post-content'
      =params[:content]
    a href='/delete' id='delete-link' Delete this Post
READVIEW
  end
end

get '/setup' do
  $blog_posts = []
end