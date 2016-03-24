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
Wait until page contains all elements
    select frame  mainframe
    wait until page contains element  name=active
    wait until page contains element  name=doActionButton
    unselect frame

Unselect Checkbox Availibility Active
    testProjectEdit.Wait until page contains all elements
    select frame  mainframe
    checkbox should be selected  xpath=//input[@name="active"]
    unselect checkbox  xpath=//input[@name="active"]
    testProjectEdit.Click Save Button
    unselect frame

Click Save Button
    click element  name=doActionButton
