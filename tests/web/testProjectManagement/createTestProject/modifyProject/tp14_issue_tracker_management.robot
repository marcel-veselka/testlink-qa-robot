*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../../resource/testlink.robot
Test Setup  Run Keywords  testlink.Create new Test Project
...                 AND   testlink.Create Issue Tracker
Test Teardown  Run Keywords  testlink.Delete Issue Tracker from test Project
...                 AND      testlink.Delete Issue Tracker ${ISSUETRACKER}
...                 AND      testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...                 AND      Close all browsers


*** Variables ***
${ISSUETRACKER}  IssueTrackerName
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
${newTestProjectName}  newTestProject
${newTestProjectPrefix}  newProjectPrefix



*** Test Cases ***

Issue Tracker Management
    testlink.Login as admin correct
    testlink.Go to Test Project Management
    testlink.Add Issue Tracker to test project
    testlink.Save test project and check Issue Tracker has been added


