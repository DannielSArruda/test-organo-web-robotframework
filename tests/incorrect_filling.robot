*** Settings ***
Documentation      A test suite for incorrect filling
Resource           ../resources/main.robot
Test Setup         Given I access Organo
Test Teardown      Then close the browser

*** Test Cases ***
Verify if the system displays a required field message when a required field is not filled out correctly
    [Tags]    TS-001    not_filled_form    negative
    Given I click the "Create Card" button
    Then the system should display a required field message
