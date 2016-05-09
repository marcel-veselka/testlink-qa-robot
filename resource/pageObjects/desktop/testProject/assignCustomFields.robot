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


Check Assign Custom Fields
    select frame  name=mainframe
    wait until page contains  Assign custom fields
    wait until page contains element  doAssign
    unselect frame

Check Page Contains Custom Fields
    select frame  mainframe
    wait until page contains element  xpath=//input[@name="doAssign"]
    wait until page contains element  xpath=//tr[contains(.,"${CFNAME}")]
    wait until page contains element  xpath=//tr[contains(.,"${CFNAME}")]//td/input[@type="checkbox"]
    unselect frame

Assign Custom Fields
    select frame  mainframe
    click element  xpath=//tr[contains(.,"${CFNAME}")]//td/input[@type="checkbox"]
    click element  xpath=//input[@name="doAssign"]
    unselect frame

Check Custom Field Was Assigned
    select frame  mainframe
    wait until page contains  Assigned custom fields
    wait until page contains element  xpath=//tbody[tr[contains(.,"${CFNAME}")]]
    unselect frame
