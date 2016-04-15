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
    wait until page contains element  expand_tree
    click element  expand_tree
    wait until page contains  ${newTestProjectPrefix}-1:${title}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} (")]]
    double click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  Requirements Specification Document
    unselect frame

Assign Requirements
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=idSRS
    click element  name=idSRS
    select from list by label  idSRS  [${dokumentID}] - ${title}
    wait until page contains element  name=actionButton
    click element  name=actionButton
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  Please select a requirement
    wait until page contains element  xpath=//button[text()="OK"]
    click element  xpath=//button[text()="OK"]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//tbody//img[@title="check/uncheck all"]
    wait until page contains element  name=actionButton
    click element  xpath=//tbody//img[@title="check/uncheck all"]
    click element  name=actionButton
    unselect frame

Check Assign Requirements
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click button  name=expand_tree
    wait until page contains  ${newTestProjectPrefix}-1:${title} [1]
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="div_assigned_req"]/table/tbody
    unselect frame

Unassign Requirements And Check Availiable Requirements
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click button  name=expand_tree
    wait until page contains  ${newTestProjectPrefix}-1:${title} [1]
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="div_assigned_req"]/table/tbody
    wait until page contains element  name=unassign
    wait until page contains element  xpath=//*[@id="div_assigned_req"]//tbody//img[@title="check/uncheck all"]
    click element  xpath=//*[@id="div_assigned_req"]//tbody//img[@title="check/uncheck all"]
    click element  name=unassign
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  Available Requirements
    wait until page does not contain element  xpath=//*[@id="div_assigned_req"]/table
    unselect frame
    select frame  mainframe
    select frame  workframe
    page should contain element  div_free_req
    unselect frame