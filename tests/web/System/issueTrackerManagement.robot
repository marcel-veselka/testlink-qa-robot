*** Settings ***
Documentation  This test suite controls creating and editing of Issue Tarcker.

Resource       ../../../resource/helper/desktopHeaderSystem.robot
Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot

Suite Setup     Run keywords        Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords        Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 Close all browsers

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               issueTrackerManagement
${newTestProjectPrefix}             issue
${newTestProjectDescription}        Test suite customFieldManagement
${newTestProjectName1}               TC14
${newTestProjectPrefix1}             TC14


${ISSUETRACKER}                 IssueTrackerName
${ISSUETRACKER1}                IssueTrackerName1
${ISSUETRACKER2}                IssueTrackerName2
${ISSUETRACKER3}                IssueTrackerName3
${ISSUETRACKER4}                IssueTrackerName4
${ISSUETRACKER5}                IssueTrackerName5
${ISSUETRACKER6}                IssueTrackerName6
${ISSUETRACKER7}                IssueTrackerName7
${ISSUETRACKER8}                IssueTrackerName8
${ISSUETRACKER9}                IssueTrackerName9
${ISSUETRACKER10}               IssueTrackerName10
${ISSUETRACKER11}               IssueTrackerName11
${ISSUETRACKER12}               IssueTrackerName12
${NEWISSUETRACKER}              newIssueTracker
${CONFIGURATION}  <!-- Template bugzillaxmlrpcInterface -->
            ...  <issuetracker>
            ...  <username>USERNAME</username>
            ...  <password>PASSWORD</password>
            ...  <uribase>http://bugzilla.mozilla.org/</uribase>
            ...  <!-- In order to create issues from TestLink, you need to provide this MANDATORY info -->
            ...  <product>BUGZILLA PRODUCT</product>
            ...  <component>BUGZILLA PRODUCT</component>
            ...  <!-- This can be adjusted according Bugzilla installation. -->
            ...  <!-- COMMENTED SECTION
            ...  There are defaults defined in bugzillaxmlrpcInterface.class.php.
            ...  <version>unspecified</version>
            ...  <severity>Trivial</severity>
            ...  <op_sys>All</op_sys>
            ...  <priority>Normal</priority>
            ...  <platform>All</platform> -->
            ...  </issuetracker>

*** Test Cases ***

108 Edit Issue Tracker

    Create Issue Tracker ${ISSUETRACKER}
    Click created Issue Tracker with name ${ISSUETRACKER}
    Modify name and type of Issue Tracker
    Delete created ${ISSUETRACKER}

14 Issue Tracker Management

    Preconditions for tc14
    Change Test Project and go to ${testProjectManagement} ${testProjectManagement}
    ###  Keyword includes setting the issue tracker "Active"  ###
    Add Issue Tracker ${ISSUETRACKER12} to test project ${newTestProjectName1}
    Save test project and check Issue Tracker has been added
    Postcondition for tc14

107 Issue Tracker Management

    Create all possible types of Issue Tracker and check it
    Delete all created issue trackers

*** Keywords ***

Preconditions for tc14
    Login and Create new Test Project ${newTestProjectName1} ${newTestProjectPrefix1}
    Create Issue Tracker ${ISSUETRACKER12}
    Click created Issue Tracker with name ${ISSUETRACKER12}

Postcondition for tc14
    Delete test project  ${newTestProjectName1}  ${newTestProjectPrefix1}
    Delete created ${ISSUETRACKER12}

