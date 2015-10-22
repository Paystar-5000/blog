require 'page-object'

class HomePage
	include PageObject

	page_url "http://localhost:4567/home"

	div(:title, :id => "post-title")
	div(:author, :id => "post-author")
	div(:date, :id => "post-date")
	div(:content, :id => "post-content")
    link(:create_link, :id => "create-link")


end