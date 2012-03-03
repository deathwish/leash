Feature: Remove a background process
  As a leash user, I would like to be able to remove
  background processes, so that I don't waste CPU and RAM.

  Scenario: Removing a simple process
    Given I have an empty configuration
	And I have added a process named "simple_server" running the command "${LEASH_DIRECTORY}/test_bin/simple_server"
    When I remove the process named "simple_server"
    And I start leash
    Then "simple_server" should not be running
    And I should be able to stop leash
