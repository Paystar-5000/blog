@bs
Feature: Create a post

As an author
I want to create a post
So that I can share my knowledge with the world

Scenario: Creating a valid post
Given I am on the post submission page
When I create a valid post
Then I should be able to enter the post title
And I should be able to enter the post body
And I should be able to enter the post author name

Scenario: Should not be able to add duplicate titles
Given I am on the post submission page
When I create a post with a duplicate title
Then I get a duplicate post error

Scenario: Should be able to access the home page
Given I am on the post submission page
Then I should be able to access the home page