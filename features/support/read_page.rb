require 'page-object'

class ReadPage
	include PageObject

	page_url "http://localhost:4567/read"

	div(:title, :id => "post-title")
	div(:author, :id => "post-author")
	div(:date, :id => "post-date")
	div(:content, :id => "post-content")
	link(:home_link, :id => "home-link")
end