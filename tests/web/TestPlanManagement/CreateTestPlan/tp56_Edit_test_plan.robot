*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan testPlan1
...             AND         testlink.Create New Test Plan testPlan2
...             AND         testlink.Create Build with name buildName
...             AND         testlink.Create test suite suite1 in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in suite1
#...             AND         testlink.Add Test Case To the Test Plan




*** Variables ***

${newTestProjectName}               IamNewTestProject
${newTestProjectPrefix}             ThisIsMyPrefix
#${TestPlanManagementName}           TestplanNumberOne
${TestPlanManagementDescription}    DescriptionDescription
${Description}                      Bla Bla Descritpion
${testCaseNameNew}                  tc1
${testCaseName}                     tc1

*** Test Cases ***

Edit Test Plan
    capture page screenshot