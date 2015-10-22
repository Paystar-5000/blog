Feature: List of posts

As a reader
I want to read posts from my favorite blogger
So that I can learn something


Scenario: Published posts should be immediately available to readers
When I publish a post
Then it is immediately available on the home page
And it has a title
And it has an author name
And I can access the create post page
