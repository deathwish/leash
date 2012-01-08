Feature: Start the leash server
  As a leash user, I would like to start the server
  So that I can run my webapps.

  Scenario: Running an empty configuration
    Given I have an empty configuration
    When I start leash
    Then "procer" should be running
    And "mongrel2" should be running
    And I should be able to stop leash

