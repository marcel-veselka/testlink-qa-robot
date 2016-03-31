*** Settings ***
Documentation  A test case for changing the project availibility

Resource  ../../../../../resource/testlink.robot


Test Teardown  Run Keywords  testlink.Delete Issue Tracker from test Project
                   ...  AND  Close browser


*** Variables ***
${IssueTrackerFullName}  IssueTracker ( bugzilla (Interface: xmlrpc) )
${IssueTrackerName}  IssueTracker
${newTestProjectName}  111



*** Test Cases ***

Issue Tracker Management
    testlink.Login as admin correct
    testlink.Go to Test Project Management
    testlink.Add Issue Tracker to test project
    testlink.Save test project and check Issue Tracker has been added


