*** Settings ***

Documentation  Test suite with a single test case, that checks
...            execution of test.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Test Setup  Run keywords            Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords         Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 Close browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               testExecution
${newTestProjectPrefix}             testExecution
${testSuiteName}                    tsuite91
${testDescription}                  DescriptionOfTest91
${testCaseName}                     tc91
${testCaseName2}                    tc91_1
${testCaseName3}                    tc91_2
${TestPlanName}                     testPlanExecution
${TestPlanDescription}              Description
${buildName}                        buildName
${buildDescription}                 DescriptionOfBuild


*** Test Cases ***

91 Execute Test
    Preconditions for tp91
    Add Test Suite to Test Plan
    Execute Test Suite

*** Keywords ***

Preconditions for tp91
    Go to index page and change testproject
    Create New Test Plan ${TestPlanName}
    Create Build with name ${buildName}
    Go to index page and change testproject
    Create Test Suite
    Create test case ${testCaseName} in ${testSuiteName}
    Create test case ${testCaseName2} in ${testSuiteName}
    Create test case ${testCaseName3} in ${testSuiteName}
