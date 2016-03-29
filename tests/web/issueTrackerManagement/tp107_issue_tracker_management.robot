*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot
Test Teardown  Run keywords  testlink.Delete all created issue trackers
...            AND           Close browser
#ss
*** Variables ***
${ISSUETRACKER}  IssueTrackerName
${ISSUETRACKER1}  IssueTrackerName1
${ISSUETRACKER2}  IssueTrackerName2
${ISSUETRACKER3}  IssueTrackerName3
${ISSUETRACKER4}  IssueTrackerName4
${ISSUETRACKER5}  IssueTrackerName5
${ISSUETRACKER6}  IssueTrackerName6
${ISSUETRACKER7}  IssueTrackerName7
${ISSUETRACKER8}  IssueTrackerName8
${ISSUETRACKER9}  IssueTrackerName9
${ISSUETRACKER10}  IssueTrackerName10
${ISSUETRACKER11}  IssueTrackerName11
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

Issue Tracker Management
    testlink.Login as admin correct
    testlink.Start Creating Issue Tracker Management
    testlink.Fill in all the fields, types and finish creating
    testlink.Check issue trackers have been created



