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


Check Test Plan Management

    select frame  name=mainframe
    wait until page contains  Test Plan Management
    wait until page contains element  Create
    unselect frame

Create Test Plan Management

    select frame  name=mainframe
    wait until page contains element  create_testplan
    click button  create_testplan
    unselect frame

Check Test Plan Management is Created
    [Arguments]   ${TestPlanManagementName}

    select frame  mainframe
    wait until page contains  Test Plan Management
    wait until page contains element  xpath=//a[contains(text()," ${TestPlanManagementName} ")]
    unselect frame
