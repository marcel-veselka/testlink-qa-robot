*** Settings ***

Documentation   Test about adding platforms using blue arrows in the testlink

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup   Run keywords  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         Go to index page and change testproject
...             AND         Create New Test Plan ${TestPlanName}
...             AND         Create Platform ${PlatformName}
...             AND         Create Platform ${PlatformName1}



Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           testPlanContent
${newTestProjectPrefix}         testPlan
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                tsuite130
${testCaseName}                 tc130
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan
${PlatformName}                 Platform130
${PlatformName1}                Platform130_1


*** Test Cases ***

130 Add Platform(s) to a Test plan

    Add single Platform to Test Plan
    Add Platform to Test Plan
