*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanManagementName}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create Build with name ${buildName}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         headerPage.Go to index page



Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser


*** Variables ***

${newTestProjectName}               NewProjectNewProject
${newTestProjectPrefix}             npnp
${TestPlanManagementName}           NewTestPlanManagement
${TestPlanManagementDescription}    This is New Descritoin, baby
${buildName}                        NewBuild
${Description}                      Another Description, baby
${testSuiteName}                    suiteTest
${testDescription}                  testDescription
${testCaseName}                     testCaseName
${testCaseNameNew}                  testCaseNameNew

*** Test Cases ***

Create Test Case

    desktopPage.Go to Test Specification (mainframe)
    testlink.Create New Sibling ${testCaseNameNew}
    testlink.Check All Actions Buttons For Test Case
    testlink.Show Execution History



