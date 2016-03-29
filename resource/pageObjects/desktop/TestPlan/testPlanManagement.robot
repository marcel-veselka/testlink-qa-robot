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
    click button  create_testplan
    unselect frame

Input Name

     select frame  name=mainframe
    input text  testplan_name  ${TPMName}
    unselect frame

Input Description

    sleep  1
    select frame  name=mainframe
    click element  cke_8_label
    input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${TPMDescription}
    unselect frame

Select Checkbox Active

    select frame  name=mainframe
    select checkbox  active
    unselect frame

Select Checkbox Public

    select frame  name=mainframe
    select checkbox  is_public
    unselect frame

Click Create button to finish TPM

    select frame  mainframe
    click button  Create
    unselect frame

Check Test Plan Management is Created

    select frame  mainframe
    page should contain  ${TPMName}