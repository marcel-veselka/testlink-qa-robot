*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot
Test Setup  testlink.Create Issue Tracker
Test Teardown  Close all browsers

*** Variables ***
${ISSUETRACKER}  IssueTrackerName
${NEWISSUETRACKER}  newIssueTracker
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

Edit Issue Tracker Test Case
    [Tags]  control2
    testlink.Login as admin correct
    testlink.Get to Issue Tracker Management
    testlink.Click created Issue Tracker with name ${ISSUETRACKER}
    testlink.Modify name and type of Issue Tracker
    testlink.Delete Issue Tracker ${ISSUETRACKER}
