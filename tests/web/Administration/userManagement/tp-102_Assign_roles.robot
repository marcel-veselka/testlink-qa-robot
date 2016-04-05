*** Settings ***
Documentation  A test case for assigning roles to existing users
Resource       ../../../../resource/testlink.robot
Test Setup  Run Keywords
...             loginPage.Login as admin correct    AND
...             testlink.Create and check role novaRole in user management    AND
...             close browser
Test Teardown  userManagement.Delete role novaRole

*** Variables ***
${role}  novaRole


*** Test Cases ***
Assign Test Project and Test Plan roles
    loginPage.Login as admin correct
    headerPage.Change Test Project
    headerPage.Go to User Management
    userManagement.Click bookmark Assign Test Project roles
    userManagement.Change user role in test project
    userManagement.Click bookmark Assign Test Plan roles
    userManagement.Change user role in test plan



