*** Settings ***
Documentation  A test case for succesful login as admin with correct login info
Resource       ../../../../../pageObjects/loginPageJan.robot
Resource       ../../../../../pageObjects/createTestProjectPage.robot
Resource       ../../../../../pageObjects/desktopPageJan.robot
Resource       ../../../../../pageObjects/testProjectManagementPage.robot

*** Test Cases ***
Create new test project with template OFF
    loginPageJan.Open Browser To Login Page
    loginPageJan.Wait until page contains all elements for login
    loginPageJan.Fill correct credentials and submit
    loginPageJan.Check there is no warning about login
    desktopPageJan.Wait until page contains all elements
    desktopPageJan.Click Test Project Management
    testProjectManagementPage.Wait until page contains all elements
    testProjectManagementPage.Click create
    createTestProjectPage.Wait until page contains all elements
    createTestProjectPage.Choose from test template dropdown
    createTestProjectPage.Fill Test project name
    createTestProjectPage.Fill Test project prefix
    createTestProjectPage.Submit project