Feature: List background processes
  As a leash user, I would like to know what background processes
  I am running, so that I can effectively manage them.

  Scenario: Listing processes with a custom process added
    Given I have an empty configuration
	And I have added a process named "simple_server" running the command "${LEASH_DIRECTORY}/test_bin/simple_server"
    When I list leash processes
    Then I should see "simple_server"
    And I should not see "mongrel2"
