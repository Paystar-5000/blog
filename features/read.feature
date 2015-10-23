@bs
Feature: Read entire post

As a reader
I want to read an entire post
So that I can get all the details


Scenario: Should be able to click post title from home page to get to entire post
Given I am on the home page with an entry
When I read a post
Then it should show entire posted article
And it shows the title
And it shows the author name
And I can access the home page