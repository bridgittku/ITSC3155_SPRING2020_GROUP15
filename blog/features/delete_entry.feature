Feature: Delete a blog entry
  
  As a blogger
  So that I can easily control content on my blog
  I want to be able to delete a blog entry
  
Scenario: As a blogger I want to be able to navigate from the homepage to the list of articles and the option to delete them
  Given I am on the home page
  When I click on the "My Blog" link
  Then I should be on the "Listing articles" page
  When I click on the "Destroy" link
  Then I should not see the specified article #syntax for this line