*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../../resource/testlink.robot
Test Setup  Create new Test Project
Test Teardown  close browser
*** Variables ***

${newTestProjectName}  testProject18
${newTestProjectPrefix}  tp18


*** Test Cases ***

Delete Test Project Without Platforms

    testlink.Go to index page
    testlink.Click test project dropdown
    testlink.Choose test project from dropdown
    testlink.Go to Platform Management
    testlink.Check Platform Management Without Platforms
    testlink.Go to index page
    testlink.Go to Test Project Management
    testlink.Delete empty test project
