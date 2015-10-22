Given /^I am on the post submission page$/ do
  @page = CreationPage.new @browser
  @page.goto
end

When /^I create a valid post$/ do
  @page.create_valid_post
  @page.submit
  @page = ReadPage.new @browser
end

Then /^I should be able to enter the post title$/ do
  expect(@page.title).to eq("My Blog Title")
end

And /^I should be able to enter the post body$/ do
  expect(@page.content).to eq("My post's content")
end

And /^I should be able to enter the post author name$/ do
  expect(@page.author).to eq("The Author")
end

When /^I create a post with a duplicate title$/ do
  @page.create_valid_post
  @page.submit
  @page.goto
  @page.create_valid_post
  @page.submit
end

Then /^I get a duplicate post error$/ do
  expect(@page.html).to include("Error! No duplicate titles!")
end

Then /^I should be able to access the home page$/ do
  expect(@page.home_link_element.text).to eq("Home Page")
end
