*** Settings ***
Documentation  Test Suite with several Test Cases that checks deleting project with NOTHING INSIDE,
...            deleting project that has NO PLATFORMS DEFINED, deleting test project that has PLATFORMS DEFINED,
...            BUT NOT ASSIGNED TO ANY TEST PLANS, deleting test projects that has: custom fields, keywords, platform
...            defined an assigned to test plans and test cases with custom fields.

Resource       ../../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../../resource/helper/desktopHeaderSystem.robot
Resource       ../../../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../../../resource/helper/desktopHeaderSpecification.robot

Test Setup  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           deleteProject
${newTestProjectPrefix}         deleteProject
${PlatformName}                 Platform
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan
${buildName}                    buildName
${buildDescription}             DescriptionOfBuild
${Username}                     renat.kulalov
${KeywordName}                  key
${CFNAME}                       fieldName
${CFLABEL}                      fieldLabel
${testSuiteName}                tsuite20
${testCaseName}                 tc20


*** Test Cases ***

20 Delete test project WORST CASE

    Preconditions for tc20
    Assign Custom Fields
    Check Custom Field Was Assigned
    Check Keyword Exists
    Change Test Project and go to ${addRemovePlatforms} ${addRemovePlatforms}
    Check there is platform assigned
    Check Custom Fields Are Visible
    Delete Custom Field ${CFNAME}
    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
    Check that test has been deleted

*** Keywords ***

Preconditions for tc20
    Go to index page and change testproject
    Create New Test Plan ${TestPlanName}
    Create Platform ${PlatformName}
    Add single Platform to Test Plan
    Create Build with name ${buildName}
    Create test suite ${testSuiteName} in test project ${newTestProjectName}
    Create test case ${testCaseName} in ${testSuiteName}
    Create New Version Of TC ${testCaseName}
    Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
    Keywords ${testCaseName}
    Start creating Define Custom Fields
    Change Test Project and go to ${assignCustomFields} ${checkAssignCustomFields}
