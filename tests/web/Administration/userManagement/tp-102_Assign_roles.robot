*** Settings ***
Documentation  A test case for assigning roles to existing users
Resource       ../../../../resource/testlink.robot
Test Setup  Run Keywords
...             testlink.Login as admin correct    AND
...             testlink.Create and check role ${role} in user management
Test Teardown  userManagement.Delete role novaRole
...            AND           Close all browsers

*** Variables ***
${role}  novaRole


*** Test Cases ***
Assign Test Project and Test Plan roles
    #testlink.Login as admin correct
    headerPage.Change Test Project
    headerPage.Go to User Management
    userManagement.Click bookmark Assign Test Project roles
    userManagement.Change user role in test project
    userManagement.Click bookmark Assign Test Plan roles
    userManagement.Change user role in test plan



