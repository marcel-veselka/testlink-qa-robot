*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${xpathInput1}                  xpath=//*[@id="item_view"]/tbody/tr[1]/td[2]/input
${xpathInput2}                  xpath=//*[@id="item_view"]/tbody/tr[2]/td[2]/input
${xpathTable}                   xpath=//table[@id="item_view"]
${xpathIssueTracker}            xpath=//*[@id="issue_tracker_id"]
${elementIssueTrackerEnabled}   issue_tracker_enabled
${elementIssueTrackerSelect}    //select[@name="issue_tracker_id"]]
${itemViewWrapper}              item_view_wrapper

*** Keywords ***

Check Test Project Management
    select frame  mainframe
    wait until page contains  Test Project Management
    wait until page contains element  search
    unselect frame

Click Create
    select frame  mainframe
    click button  Create
    unselect frame

Add Test Project Name
    select frame  mainframe
    input text  tprojectName  ${testprojectname}
    unselect frame

Add Prefix
    select frame  mainframe
    input text  tcasePrefix  ${testprojectprefix}
    unselect frame

Create Test Project
    select frame  mainframe
    click button  doActionButton
    unselect frame

Filled the valid name and prefix ${newTestProjectName} ${newTestProjectPrefix}
    select frame  mainframe
    wait until page contains element  ${xpathInput1}
    wait until page contains element  ${xpathInput2}
    input text  ${xpathInput1}  ${newTestProjectName}
    input text  ${xpathInput2}   ${newTestProjectPrefix}
    Click Button  doActionButton
    unselect frame

Check Warning message
    select frame  mainframe
    execute javascript  var imput = document.getElementsByName('tprojectName'); imput[0].required = false;
    execute javascript  var imput = document.getElementsByName('tcasePrefix'); imput[0].required = false;
    click button  Save
    wait until page contains  Project name cannot be empty!
    wait until page contains  Warning!!
    wait until page contains  OK
    click button    OK
    unselect frame

Check new project exists
    [Arguments]  ${newTestProjectName}
    select frame  mainframe
    wait until page contains element  ${xpathTable}
    element should contain  ${xpathTable}   ${newTestProjectName}
    unselect frame

Click desired project ${newTestProjectName}
    select frame  mainframe
    click link  ${newTestProjectName}
    unselect frame

Check Test Project Is Inactive ${newTestProjectName}
    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Inactive (click to set active)"]]
    unselect frame

Check Test Project Is Active ${newTestProjectName}
    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame

Unactive Test Project by Bulb ${newTestProjectName}
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Inactive (click to set active)"]]
    page should not contain  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame

Add IT to TP ${ISSUETRACKER}
    select frame  mainframe
    wait until page contains element  ${xpathIssueTracker}
    wait until page contains element  ${elementIssueTrackerEnabled}
    select checkbox  ${elementIssueTrackerEnabled}
    select from list by label  ${xpathIssueTracker}  ${ISSUETRACKER} ( bugzilla (Interface: xmlrpc) )
    click element  ${elementIssueTrackerEnabled}
    unselect frame

Check Issue Tracker has been added to the Test Project
    select frame  mainframe
    wait until page contains element  ${xpathTable}
    element should contain  ${xpathTable}   ${ISSUETRACKER}
    unselect frame

Wait Until Page Contains TP and Click It ${newTestProjectName}
    select frame  mainframe
    wait until page contains element  xpath=//a[contains(.,"${newTestProjectName}")]
    click element  xpath=//a[contains(.,"${newTestProjectName}")]
    unselect frame

Delete TP ${newTestProjectName} ${newTestProjectPrefix}
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    wait until page does not contain element  ${newTestProjectName}
    wait until page does not contain element  ${newTestProjectPrefix}
    unselect frame

Check and Delete Test Project ${newTestProjectName} ${newTestProjectPrefix}
    testProjectManagement.Check Test Project Management
    testProjectManagement.Delete TP ${newTestProjectName} ${newTestProjectPrefix}

Check Test Project and Click Create ${newTestProjectName} ${newTestProjectPrefix}
    testProjectManagement.Check Test Project Management
    testProjectManagement.Check Unique ${newTestProjectName} ${newTestProjectPrefix}
    testProjectManagement.Click Create

Check Unique ${newTestProjectName} ${newTestProjectPrefix}
    select frame  mainframe
    element should not contain  ${itemViewWrapper}  ${newTestProjectName}
    element should not contain  ${itemViewWrapper}  ${newTestProjectPrefix}
    unselect frame

Delete TP NOTHING INSIDE
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame

Delete empty test project
    testProjectManagement.Check Test Project Management
    testProjectManagement.Delete TP NOTHING INSIDE

Check that test has been deleted
    select frame  mainframe
    wait until page does not contain element  ${newTestProjectName}
    wait until page does not contain element  ${newTestProjectPrefix}
    unselect frame

Leave empty TP name and prefix
    [Tags]  tp12
    testProjectManagement.Add Test Project Name
    testProjectManagement.Add Prefix
    testProjectManagement.Check Warning message

Fill and Valid ${newTestProjectName} ${newTestProjectPrefix}
   testProjectManagement.Filled the valid name and prefix ${newTestProjectName} ${newTestProjectPrefix}
   testProjectManagement.Check new project exists  ${newTestProjectName}

Save test project and check Issue Tracker has been added
    [Tags]  tp14
    testProjectManagement.Create Test Project
    testProjectManagement.Check Issue Tracker has been added to the Test Project

Add Issue Tracker ${ISSUETRACKER} to Test Project ${newTestProjectName}
    [Tags]  tp14
    testProjectManagement.Check Test Project Management
    testProjectManagement.Click desired project ${newTestProjectName}
    testProjectManagement.Add IT to TP ${ISSUETRACKER}