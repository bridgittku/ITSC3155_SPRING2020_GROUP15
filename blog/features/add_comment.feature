Feature: Add a comment to a blog entry
  
  As a viewer
  So that I can easily interact on the blog
  I want to be able to comment on a blog entry
  
Scenario: As a blogger I want to be able to navigate from the homepage to a specific article so I can comment on it
  Given I am on the home page
  When I click on the "My Blog" link
  Then I should be on the "Listing articles" page
  When I click on the "Show" link #syntax to show a specific article
  Then I should be on the "Comments" page
  And I should see the "Commenter" field 
  And I should see the "Body" field