*** Settings ***

Documentation   Test suite with a single test case, which controls the functionality of
...             editing options for test cases within Add/Remove Test Cases platform

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup   Run keywords  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         Create New Test Plan ${TestPlanName}
...             AND         Create Build with name ${buildName}
...             AND         Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         Create test case ${testCaseName} in ${testSuiteName}
...             AND         Add Test Case ${testCaseName} To the Test Plan ${TestPlanName}
...             AND         Execute Test ${testCaseName}

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           addRemoveTC
${newTestProjectPrefix}         testCases
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                tsuite131
${testCaseName}                 tc131
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan
${buildName}                    buildName
${buildDescription}             DescriptionOfBuild

*** Test Cases ***

131 Edit Test Case
    Change Test Project and go to ${addRemoveTestCases} ${checkAddRemoveTestCases}
    Show Test Cases
    Design Test Case ${testCaseName}
    Change Window To The Edition Mode
    Test Spec Design Edit ${testCaseName} Test Case
    Execution History ${testCaseName} Open Window


