*** Settings ***

Documentation   This is a test suite with several test cases, which controls assigning test case execution to certain user
...             and updating linked test case version to current test plan.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup   Run keywords  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         Go to index page and change testproject
...             AND         Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         Create test case ${testCaseName} in ${testSuiteName}
...             AND         Create New Version Of TC
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
${newTestProjectName}           testPlanContent
${newTestProjectPrefix}         testPlan
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                tsuite78
${testCaseName}                 tc78
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan
${PlatformName}                 Platform78
${PlatformName1}                Platform78_1
${buildName}                    buildName
${Username}                     renat.kulalov
${Username1}                    jan.pippal
${buildDescription}             DescriptionOfBuild


*** Test Cases ***

78 Update Linked TC version
###try
    Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
    Update linked TC ${testCaseName} ${testSuiteName} version
    Check TC Version was changed ${testCaseName} ${testSuiteName} in Update Linked TC Version
    Check TC Version was changed ${testCaseName} ${testSuiteName} in Assign TC Execution