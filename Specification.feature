Feature: Write a String::format method

  # Write your own String::format method. The method should accept an unknown
  # amount of parameters. It should replace all specifiers with the given values.
  # It should throw an exception if there are more specifiers then arguments and vice versa.
  # It should also throw an exception if the wrong type of specifier is used.
  # %s = String
  # %d = Integer or Double

  Scenario: Replace a single specifier
    Given the string "Hello %s!"
    And the values
      | world |
    When they go through the String::format method
    Then I expect the string "Hello world!"

  Scenario: Replace multiple string specifiers
    Given the string "Hello %s!"
    And the values
      | Hello |
      | world |
    When they go through the String::format method
    Then I expect the string "Hello world!"

  Scenario: Replace a decimal specifier
    Given the string "I am number %d!"
    And the values
      | 1 |
    When they go through the String::format method
    Then I expect the string "I am number 1!"

  Scenario: A wrong replacement gives an exception
    Given the string "I am a number %d!"
    And the values
      | one |
    When they go through the String::format method
    Then I expect an Exception

  Scenario: An incorrect amount of specifiers gives an exception
    Given the string "I am a %s %s!"
    And the values
      | one |
    When they go through the String::format method
    Then I expect an Exception