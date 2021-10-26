@javascript @block_searchcourses
Feature: Search courses
  I need to be able to search for courses

  Background:
    Given the following "courses" exist:
        | fullname | shortname | summary |
        | A | A1 | |
        | AB | C2 | |
        | ABC | A3 | |
        | BC | B4 | |
        | BCD | B5 | |
        | E | E6 | About a course |
    And the following "users" exist:
        | username | firstname | lastname | email |
        | teacher1 | Teacher | 1 | teacher1@example.com |
    And the following "course enrolments" exist:
        | user | course | role |
        | teacher1 | C2 | editingteacher |
    And I log in as "admin"
    And I navigate to "Appearance > Default Dashboard page" in site administration
    And I press "Blocks editing on"
    And I add the "Search Courses (Autocomplete)" block if not present
    And I press "Blocks editing off"
    And I press "Reset Dashboard for all users"
    And I log out

  @javascript
  Scenario: Teacher can use the search courses block
    And I log in as "teacher1"
    And I click on "ac-input" "field"
    And I type "a" in search courses
    Then "//li[@data-text='A']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='AB']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='ABC']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='BC']" "xpath_element" should not exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='BCD']" "xpath_element" should not exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='E']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And I type "b" in search courses
    And I wait "10" seconds
    Then "//li[@data-text='A']" "xpath_element" should not exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='AB']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='ABC']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='BC']" "xpath_element" should not exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='BCD']" "xpath_element" should not exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='E']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And I press the backspace key
    And I press the backspace key
    And I type "c" in search courses 
    Then "//li[@data-text='A']" "xpath_element" should not exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='AB']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='ABC']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='BC']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='BCD']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And "//li[@data-text='E']" "xpath_element" should exist in the "#course_search_ac" "css_element"
    And I log out
