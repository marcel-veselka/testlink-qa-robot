*** Settings ***

Documentation   This is a test suite with several test cases, which controls assigning test case execution to certain user
...             and updating linked test case version to current test plan.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Test Setup   Run keywords  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           testPlanCont
${newTestProjectPrefix}         ConManagement
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                tsuite78
${testSuiteName1}               tsuite77
${testSuiteName2}               tsuite77_1
${testCaseName}                 tc78
${testCaseName1}                tc78_1
${testCaseName2}                tc77
${testCaseName3}                tc77_1
${TestPlanName}                 testPlan78
${TestPlanName1}                testPlan77
${TestPlanName2}                testPlan77_1
${TestPlanDescription}          DescriptionOfTestPlan
${PlatformName}                 Platform
${PlatformName1}                Platform1
${buildName}                    buildName78
${buildName1}                   buildName77
${Username}                     renat.kulalov
${Username1}                    jan.pippal
${buildDescription}             DescriptionOfBuild
${NoFilter}                     [Any]


*** Test Cases ***

77 Set Urgent Test
    [Tags]  77
    Preconditions for tc77
    Search ${testSuiteName1} By ${PlatformName} From ${NoFilter}
    Search ${testSuiteName2} By ${TestPlanName2} From ${TestPlanName1}
    Set Test Suite ${testSuiteName2} & Test Case Urgency

78 Update Linked TC version
    Preconditions for tc78
    Update linked TC ${testCaseName} ${testSuiteName} version
    Check TC Version was changed ${testCaseName} ${testSuiteName} in Update Linked TC Version
    Check TC Version was changed ${testCaseName} ${testSuiteName} in Assign TC Execution
    ### Last two steps are checking updating all test cases from one test suite by the button ###
    ### "Bulk Update to latest version". Methods also check if TC's versions were changed in ###
    ### Assign TC Execution page. ###
    Update all TC's versions to the latest one
    Check changes were saved all TCs ${testCaseName} ${testCaseName1} are updated

*** Keywords ***

Preconditions for tc77
    Create test suite ${testSuiteName1} in test project ${newTestProjectName}
    Create test case ${testCaseName2} in ${testSuiteName1}
    Create New Test Plan ${TestPlanName1}
    Create Platform ${PlatformName}
    Add single Platform to Test Plan
    Create Build with name ${buildName1}
    Add TC ${testCaseName2} to platform ${PlatformName} users ${Username}
    Create test suite ${testSuiteName2} in test project ${newTestProjectName}
    Create test case ${testCaseName3} in ${testSuiteName2}
    Create New Test Plan ${TestPlanName2}
    Create Platform ${PlatformName1}
    Test Case ${testCaseName3} Add To Test Plan ${TestPlanName2}

Preconditions for tc78
    Create test suite ${testSuiteName} in test project ${newTestProjectName}
    Create test case ${testCaseName} in ${testSuiteName}
    Create test case ${testCaseName1} in ${testSuiteName}
    Create New Version Of TC ${testCaseName}
    Create New Version Of TC ${testCaseName1}
    Create New Test Plan ${TestPlanName}
    Create Platform ${PlatformName}
    Add single Platform to Test Plan
    Create Build with name ${buildName}
    Assign all test cases to ${PlatformName}

