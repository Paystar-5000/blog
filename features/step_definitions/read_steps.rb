Given /^I am on the home page with an entry$/ do
  @page = CreationPage.new @browser
  @page.goto
  @page.create_valid_post
  @page.submit
  @page = HomePage.new @browser
  @page.goto
end

When /^I read a post$/ do
  @page.read_link
  @page = ReadPage.new @browser
end

Then /^it should show entire posted article$/ do
  expect(@page.title).to eq("My Blog Title")
end

And /^it shows the blog title$/ do
  expect(@page.title).to eq("My Blog Title")
end

And /^it shows the blog author name$/ do
  expect(@page.author).to eq("The Author")
end

And /^I can access the home page$/ do
  expect(@page.home_link_element.text).to eq("Home Page")
end