*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/pageObjects/loginPage.robot
Resource       ../../../resource/pageObjects/desktop/headerPage.robot
Resource       ../../../resource/pageObjects/desktop/desktopPage.robot

*** Test Cases ***
Info Boxes
    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Change Test Project
    Check info
    [Teardown]  close browser
