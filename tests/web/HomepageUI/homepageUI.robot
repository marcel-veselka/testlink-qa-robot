*** Settings ***
Documentation  This test suite is used to check deleting and editing of Custom Fields in TestLink.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup     Run keywords      Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND               Create New Test Plan ${TestPlanName}
...             AND               Create Build with name ${buildName}
...             AND               Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND               Create test suite ${testSuiteName1} in test project ${newTestProjectName}
...             AND               Create test case ${testCaseName} in ${testSuiteName}
...             AND               Keywords ${testCaseName}

Suite Teardown  Run keywords      Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND               Close all browsers

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               homepage
${newTestProjectPrefix}             UI
${newTestProjectName1}              homepage1
${newTestProjectPrefix1}            UI1
${testSuiteName}                    tsuite109
${testSuiteName1}                   tsuite109_1
${testCaseName}                     tc109
${TestPlanName}                     testPlan
${TestPlanDescription}              Description
${buildName}                        buildName
${buildDescription}                 DescriptionOfBuild
${KeywordName}                      keyWord
${elementTCID}                      TCID
${elementTitle}                     name
${textForSearchingTC}               1


*** Test Cases ***

5 Validation of TP roll out menu and search bar

    HeaderPage Go to ${indexPage}
    Create TP ${newTestProjectName1} ${newTestProjectPrefix1}
    Go to index page and change testproject
    Search by ${elementTCID} ${testCaseName} with ${textForSearchingTC}
    Search by ${elementTitle} ${testCaseName} with ${testCaseName}
    Teardown for tc5

4 Log in as admin and check layout

    Check desktop links
### New function was added to this method. Now "Check header links"  also checks 'Logout' link ###
    Check header links

109 Navigator Tree

    Preconditions for tc109
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Expand tree
    Check Expand tree
    Collapse tree
    Check Collapse tree
    Control White Arrow
    Control Black Arrow

*** Keywords ***

Teardown for tc5
    Delete test project  ${newTestProjectName1}  ${newTestProjectPrefix1}

Preconditions for tc109
    Login as admin ${LOGIN} ${PASSWORD}
    loginPage.Check there is no warning about login
