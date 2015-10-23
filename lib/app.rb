require 'sinatra'
require 'slim'

get "/home" do
  $blog_posts ||= []
  slim  :home_page unless $blog_posts.empty?
end

get "/read" do
  slim :read_page
end

get "/create" do
  slim  :create_page
end

get '/read/:index' do |index|
  $single_post = $blog_posts[index.to_i]
  slim :read_page
end

post '/read' do
  $blog_posts ||= []
  if $blog_posts.any?{ |hash| hash["title"] == params[:title]}
  	"Error! No duplicate titles!"
  else
    $blog_posts.push({ "title" => params[:title], "author" => params[:author], "date" => params[:date], "content" => params[:content]})
    $single_post = $blog_posts.last
    slim :read_page
  end
end

get '/setup' do
  $blog_posts = []
end

__END__

@@home_page
doctype html
html
  head
    title My Blog - Home Page
  body
    - $blog_posts.each_with_index do |post, i|
      h3 
        a href="/read/#{i}" id="post-title#{i}"
          = post['title']
      div id="post-author#{i}"
        = post['author']
      div id="post-date#{i}"
        = post['date']
      div id="post-content#{i}"
        = post['content']
      div id="post-link#{i}"
    a href='/create' id='create-link' Create a Post

@@read_page
doctype html
html
  head
    title My Blog - Read Page
  body
    a href='/home' id='home-link' Home Page
    div id='post-title'
      =$single_post['title']
    div id='post-author'
      =$single_post['author']
    div id='post-date'
      =$single_post['date']
    div id='post-content'
      =$single_post['content']

@@create_page
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