*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot

Test Teardown  close browser

*** Variables ***
${newTestProjectPrefix}  tp
${newTestProjectName}  testing project
#blabla

*** Test Cases ***
Validation of changing the Test Project
    testlink.Login as admin correct
    testlink.Choose test project from dropdown
    testlink.Change and check test project

