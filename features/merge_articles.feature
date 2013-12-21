Feature: Merge Articles
  As a blog administrator
  In order to reduce the number of similar articles
  I want to be able to merge 2 articles into 1

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully merge articles
    Given I am on the edit article 1 page
    When I fill in "Article ID" with "2"
    And I press "Merge"
    And I visit the edit article 1 page
    Then I should see "first article"
    And I should see "second article"


  Scenario: A non-admin cannot merge articles.
    Given I am not logged in
    And I am on the edit article 1 page
    Then I should not see "Merge Articles"

  Scenario: Unsuccessfully merge article with itself
    Given I am on the edit article 1 page
    When I fill in "Article ID" with "1"
    And I press "Merge"
    Then I should see "was not merged"

  Scenario: Title should not change
    Given I am on the edit article 1 page
    When I fill in "Article ID" with "2"
    And I press "Merge"
    And I visit the edit article 1 page
    Then the page should contain "Hello World!"
    
  Scenario: Comments should be copied to merged article
    Given I am on the edit article 1 page
    When I fill in "Article ID" with "2"
    And I press "Merge"
    And I visit the edit article 1 page
    Then article 1 should have 3 comments
      
  