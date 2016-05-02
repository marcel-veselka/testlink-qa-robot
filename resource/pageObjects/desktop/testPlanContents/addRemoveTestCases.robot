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
Check Page Add/Remove TC
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//input[@name="doAddRemove"]
    wait until page contains element  xpath=//tbody[tr/td[contains(text(),"${PlatformName}")]][tr/td[contains(text(),"${PlatformName1}")]]
    wait until page contains element  testerID
    unselect frame


Assign TC to user ${Username}
    select frame  mainframe
    select frame  workframe
    select from list by label  testerID  ${Username}
    unselect frame

Show Test Cases
    select frame  mainframe
    select frame  treeframe
    click button  show_whole_test_spec
    unselect frame