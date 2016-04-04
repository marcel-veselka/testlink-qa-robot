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
${dokumentID}   newdokumentid
${title}        newtitle


*** Keywords ***

Select Test Suite
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=filter_testcase_name
    wait until page contains element  name=doUpdateTree
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    sleep  2
    page should contain element  xpath=//a[span[contains(text(),"${title} (")]]
    double click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  Requirements Specification Document
    unselect frame

Assign Requirements
    select frame  mainframe
    select frame  workframe
    click element  name=idSRS
    select from list by label  idSRS  [${dokumentID}] - ${title}
    wait until page contains element  name=actionButton
    click element  name=actionButton
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  OK
    click button  OK
    unselect frame
    select frame  mainframe
    select frame  workframe
    click element  xpath=//*[@id="div_assigned_req"]/table/tbody/tr[1]/th[1]/img
    click element  name=actionButton
    unselect frame

Check Assign Requirements
    select frame  mainframe
    select frame  treeframe
    click button  name=expand_tree
    sleep  4
    page should contain element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    page should contain element  xpath=//*[@id="div_assigned_req"]/table/tbody
    unselect frame

Unassign Requirements And Check Availiable Requirements
    select frame  mainframe
    select frame  treeframe
    click button  name=expand_tree
    sleep  4
    page should contain element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    page should contain element  xpath=//*[@id="div_assigned_req"]/table/tbody
    wait until page contains element  name=unassign
    click element  xpath=//*[@id="div_assigned_req"]/table/tbody/tr[1]/th[1]/img
    click element  name=unassign
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  Available Requirements
    sleep  2
    page should not contain  xpath=//*[@id="div_assigned_req"]/table
    unselect frame
    select frame  mainframe
    select frame  workframe
    page should contain element  xpath=/html/body/div[3]
    unselect frame