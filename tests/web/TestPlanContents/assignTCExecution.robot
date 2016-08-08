*** Settings ***

Documentation   This is a test suite with several test cases, which controls assigning test case execution to certain user
...             and updating linked test case version to current test plan.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup   Run keywords  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         Create test case ${testCaseName} in ${testSuiteName}
...             AND         Create New Version Of TC ${testCaseName}
...             AND         Create New Test Plan ${TestPlanName}
...             AND         Create Platform ${PlatformName}
...             AND         Create Platform ${PlatformName1}
...             AND         Add Platform to Test Plan
...             AND         Create Build with name ${buildName}

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           assignTCExecution
${newTestProjectPrefix}         assign
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                tsuite74
${testCaseName}                 tc74
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan
${PlatformName}                 Platform74
${PlatformName1}                Platform74_1
${buildName}                    buildName
${Username}                     renat.kulalov
${Username1}                    jan.pippal
${buildDescription}             DescriptionOfBuild

*** Test Cases ***

### Checking the fuctionality of Assign/ Unassign test case to a user feature ###
74 Assign Test Case Execution
    Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
    Add TC ${testCaseName} to platform ${PlatformName1} users ${Username1}
    Check Assigned TC to ${Username} and ${PlatformName}
    Check Assigned TC to ${Username1} and ${PlatformName1}
    Assign to another user ${Username} and ${PlatformName} ${Username1}
    Assign to another user ${Username1} and ${PlatformName1} ${Username}
    Check Assigned TC to ${Username} and ${PlatformName}
    Check Assigned TC to ${Username1} and ${PlatformName}
    Check Assigned TC to ${Username} and ${PlatformName1}
    Check Assigned TC to ${Username1} and ${PlatformName1}
    Unassign TC ${PlatformName}
    Unassign TC ${PlatformName1}
    Check TC Are Not Assigned ${testSuiteName}