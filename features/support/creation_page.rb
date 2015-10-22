require 'page-object'

class CreationPage
	include PageObject

	page_url "http://localhost:4567/create"

	text_field(:title, :id => "post-title")
	text_field(:author, :id => "post-author")
	text_field(:date, :id => "post-date")
	text_area(:content, :id => "post-content")
	button(:submit, :id => "submit-post")
	link(:home_link, :id => "home-link")

	def create_valid_post
		self.title = "My Blog Title"
		self.author = "The Author"
		self.date = Time.new
		self.content = "My post's content"
	end
end