*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../../../resource/testlink.robot

Test Setup  testlink.Create new Test Project
Test Teardown  close browser

*** Variables ***
${newTestProjectName}  testingProjectNew1
${newTestProjectPrefix}  prefixNew1

*** Test Cases ***
Delete Test Project

    #testlink.Login as admin correct
    testlink.Delete empty test project
    testlink.Check that test has been deleted
