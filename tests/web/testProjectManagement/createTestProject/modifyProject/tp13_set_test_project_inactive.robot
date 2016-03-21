*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../pageObjects/loginPage.robot
Resource       ../../../pageObjects/desktop/desktop.robot


Test Teardown  close browser

*** Test Cases ***
Set Test Project INACTIVE
    Login as Admin
    Go to Test Project Management


