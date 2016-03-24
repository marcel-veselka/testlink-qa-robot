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

Check new project exist
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

Wait until container with projects is here
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/tfoot
    unselect frame

