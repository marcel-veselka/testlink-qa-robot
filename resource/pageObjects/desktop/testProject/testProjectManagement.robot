*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      ff


*** Keywords ***

Check Test Project Management
    select frame  name=mainframe
    wait until page contains  Test Project Management
    wait until page contains element  search
    unselect frame

Click Create
    select frame  mainframe
    click button  Create
    unselect frame

Add Test Project Name
    select frame  name=mainframe
    input text  tprojectName  ${testprojectname}

Add Prefix
    input text  tcasePrefix  ${testprojectprefix}

Create Test Project
    select frame  mainframe
    click button  doActionButton
    unselect frame
Check new project exists
    select frame  mainframe
    element should contain  xpath=//table[@id="item_view"]  ${newTestProjectName}
    unselect frame

Click desired project
    select frame  mainframe
    click link  ${newTestProjectName}
    unselect frame

Check Test Project Is Inactive
    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Inactive (click to set active)"]]
    unselect frame

Check Test Project Is Active

    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame


Wait until container with projects is here
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/tfoot
    unselect frame

Select Active Test Project
    #click element  xpath=//tr[td//text()[contains(., '${testprojectname}')]]/td[last()]
    sleep  2
    click element  xpath=//tr[td//text()[contains(., '${testprojectname}')]]/td[setActive]
    sleep  1
    click button  Yes
    sleep  2

Unactive Test Project by Bulb

    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Inactive (click to set active)"]]
    page should not contain  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame

Add issue tracker to test project
    sleep  2
    select frame  name=mainframe
    select from list by label  xpath=//*[@id="issue_tracker_id"]  ${IssueTrackerFullName}
    unselect frame

Remove issue tracker from test project
    sleep  2
    select frame  name=mainframe
    select from list by value  xpath=//*[@id="issue_tracker_id"]  0
    unselect frame

Check Issue Tracker has been added to the Test Project
    sleep  2
    select frame  mainframe
    element should contain  xpath=//table[@id="item_view"]  ${IssueTrackerName}
    unselect frame