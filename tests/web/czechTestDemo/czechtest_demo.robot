*** Settings ***

Documentation  A test case for creating a new test project.

Resource       ../../../resource/testlink.robot

Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***

${newTestProjectName}  czechTestDemo
${newTestProjectPrefix}  ctd
${newTestProjectDescription}  Description of new test project czechTestDemo

*** Test Cases ***

Create new Test Project
    testlink.Login as admin correct
    testlink.Start creating new test project
    testlink.Fill information to create test with template OFF
    testlink.Submit and check new test project


#pybot -d results tests/web/czechTestDemo/czechtest_demo.robot
#sfdjksf
#sldsldkjhs