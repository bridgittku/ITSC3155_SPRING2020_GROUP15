Feature: Sort articles by alphabet
  
  As a blogger I want to be able to see articles in alphabetical order
  
  Scenario: as a viewer on the welcome page I want to be able to naviagate to the articles list and sort articles
    Given I am on the welcome page
     When I click on the "My Blog" link
  Then I should be on the "Listing articles" page
  When I click on the "Sort by Alphabet" link
  Then I should be on the "Listing articles" page
  And I should see 
  