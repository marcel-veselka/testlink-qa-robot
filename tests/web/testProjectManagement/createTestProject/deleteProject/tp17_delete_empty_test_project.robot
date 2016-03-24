*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../../../resource/testlink.robot

Test Setup  testlink.Create new Test Project
Test Teardown  close browser

*** Test Cases ***
Delete Test Project

    testlink.Login as admin correct
    testlink.Delete test project