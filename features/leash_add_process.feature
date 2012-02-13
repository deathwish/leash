Feature: Add a background process
  As a leash user, I would like leash to run
  my application processes for me when I start leash

  Scenario: Adding a simple process
    Given I have an empty configuration
	And I have added a process named "simple_server" running the command "${LEASH_DIRECTORY}/test_bin/simple_server"
    When I start leash
    Then "simple_server" should be running
    And I should be able to stop leash
