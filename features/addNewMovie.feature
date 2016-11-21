Feature: manually add new movie

Scenario: Create an Movie

    Given I am on the root page 
    When I follow "Add new movie"
    Then I should be on the Create new movie page
    When I fill in "movie[title]" with "Cucum_test_movie"
    And I press "Save Changes"
    
