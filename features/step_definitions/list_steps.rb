Given /^I am on the home page$/ do
  @page = HomePage.new @browser
  @page.goto
end

When /^I publish a post$/ do
  @createpage = CreationPage.new @browser
  @createpage.goto
  @createpage.create_valid_post
  @createpage.submit
end

Then /^it is immediately available on the home page$/ do
  expect(@page.html).to include("My Blog Title")
end

And /^it has a title$/ do
  expect(@page.title).to include("My Blog Title")
end

And /^it shows the author name$/ do
  expect(@page.author).to include("The Author")
end

And /^I can access the create post page$/ do
  expect(@page.create_link_element.text).to eq("Create a Post")
end