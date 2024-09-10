*** Settings ***
Documentation      A test suite for correct filling
Resource           ../resources/main.robot
Test Setup         Given I access Organo
Test Teardown      Then close the browser

*** Test Cases ***
Verify if filling out the form correctly inserts the data into the list and creates a new card in the expected team
    [Tags]    TS-001    one_card    positive
    Given I fill out the form fields
    And click the "Create Card" button
    Then I should identify the card in the expected team

Verify if it is possible to create one more card if we fill out the fields correctly
    [Tags]    TS-002    more_than_one_card    positive
    Given I fill out the form fields
    And click the "Create Card" button
    Then I should identify 3 cards in the expected team

Verify if it is possible to create a card for each available team if we fill out the fields correctly
    [Tags]    TS-003    one_card_for_each_team    positive
    Given I fill out the form fields
    Then 1 card should be created in each available team
