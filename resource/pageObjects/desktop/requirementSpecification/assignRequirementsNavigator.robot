*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${elementFilterTC}                  filter_testcase_name
${elementDoUpdateTree}              doUpdateTree
${elementExpandTree}                expand_tree
${elementIDSRS}                     idSRS
${elementActionButton}              actionButton
${elementUnassign}                  unassign
${xpathCheckUncheck}                xpath=//tbody//img[@title="check/uncheck all"]
${xpathButtonOK}                    xpath=//button[text()="OK"]
${xpathAssignReqTable}              xpath=//*[@id="div_assigned_req"]/table/tbody
${xpathAssignReqCheckUncheck}       xpath=//*[@id="div_assigned_req"]//tbody//img[@title="check/uncheck all"]

*** Keywords ***

Select Test Suite ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementFilterTC}
    wait until page contains element  ${elementDoUpdateTree}
    input text  ${elementFilterTC}  ${title}
    click button  ${elementDoUpdateTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click element  ${elementExpandTree}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} (")]]
    double click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Requirements Specification Document
    unselect frame

Assign Requirements ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementIDSRS}
    click element  ${elementIDSRS}
    select from list by label  ${elementIDSRS}  [${dokumentID}] - ${title}
    wait until page contains element  ${elementActionButton}
    click element  ${elementActionButton}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Please select a requirement
    wait until page contains element  ${xpathButtonOK}
    click element  ${xpathButtonOK}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathCheckUncheck}
    wait until page contains element  ${elementActionButton}
    click element  ${xpathCheckUncheck}
    click element  ${elementActionButton}
    unselect frame

Check Assigned Requirements ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click button  ${elementExpandTree}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathAssignReqTable}
    unselect frame

Unassign Requirements ${title}
    select frame  mainframe
    select frame  treeframe
    click button  ${elementExpandTree}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementUnassign}
    wait until page contains element  ${xpathAssignReqCheckUncheck}
    click element  ${xpathAssignReqCheckUncheck}
    click element  ${elementUnassign}
    unselect frame

Check Availiable Requirements
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Available Requirements
    wait until page contains element  div_free_req
    unselect frame