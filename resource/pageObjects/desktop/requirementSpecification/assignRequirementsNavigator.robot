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
${title}        tct77
${newTestProjectPrefix}   ntpx77
${dokumentID}   did77
${testSuiteName}                    tsuite77
*** Keywords ***

Select Test Suite

    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  name=filter_testcase_name
    wait until page contains element  name=doUpdateTree
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click element  expand_tree
    wait until page contains  ${newTestProjectPrefix}-1:${title}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} (")]]
    double click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Requirements Specification Document
    unselect frame

Click and Select Test Suite
    select frame  name=mainframe
    select frame  treeframe
    wait until page contains element  filter_toplevel_testsuite
    page should contain element  filter_toplevel_testsuite
    click element  filter_toplevel_testsuite
    double click element  xpath=//td[2]/select/option[2]
    wait until page contains element  xpath=//td[2]/select/option[2]
    page should contain element  xpath=//td[2]/select/option[2]

    wait until page contains element  xpath=//select[@name="filter_priority"]
    page should contain element  xpath=//select[@name="filter_priority"]
    click element  xpath=//select[@name="filter_priority"]
    #double click element  xpath=//*[@id="filter_importance"]/option[2]
    wait until page contains element  xpath=//tr[4]/td[2]/select/option[2]
    page should contain element  xpath=//tr[4]/td[2]/select/option[2]
    click element  xpath=//tr[4]/td[2]/select/option[2]
    wait until page contains element  name=doUpdateTree
    page should contain element  name=doUpdateTree
    click element  name=doUpdateTree
    unselect frame



Filter or select Test Case
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element   name=filter_toplevel_testsuite
    click element  xpath=//select[@name="filter_toplevel_testsuite"]
    select from list by label  ${testSuiteName}
    unselect frame

Select Test Case
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    #wait until page contains element  xpath=//*[@id="ext-gen24"]/div/a/span/span
    wait until page contains  xpath=//*[@id="ext-gen24"]/div/a
    click link  xpath=//*[@id="ext-gen24"]/div/a
    #click element  xpath=//*[@id="ext-gen24"]/div/a/span/span
    unselect frame

Adding and Added selected
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element   xpath=//*[@id="header-wrap"]/div/div/button[1]
    click element  xpath=//*[@id="header-wrap"]/div/div/button[1]
    wait until page contains element  xpath=//*[@id="header-wrap"]/div/input[2]
    click element  xpath=//*[@id="header-wrap"]/div/input[2]
    unselect frame


Assign Requirements
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  name=idSRS
    click element  name=idSRS
    select from list by label  idSRS  [${dokumentID}] - ${title}
    wait until page contains element  name=actionButton
    click element  name=actionButton
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Please select a requirement
    wait until page contains element  xpath=//button[text()="OK"]
    click element  xpath=//button[text()="OK"]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tbody//img[@title="check/uncheck all"]
    wait until page contains element  name=actionButton
    click element  xpath=//tbody//img[@title="check/uncheck all"]
    click element  name=actionButton
    unselect frame

Check Assign Requirements
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click button  name=expand_tree
    wait until page contains  ${newTestProjectPrefix}-1:${title} [1]
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="div_assigned_req"]/table/tbody
    unselect frame

Unassign Requirements And Check Availiable Requirements
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click button  name=expand_tree
    wait until page contains  ${newTestProjectPrefix}-1:${title} [1]
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="div_assigned_req"]/table/tbody
    wait until page contains element  name=unassign
    wait until page contains element  xpath=//*[@id="div_assigned_req"]//tbody//img[@title="check/uncheck all"]
    click element  xpath=//*[@id="div_assigned_req"]//tbody//img[@title="check/uncheck all"]
    click element  name=unassign
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Available Requirements
    wait until page does not contain element  xpath=//*[@id="div_assigned_req"]/table
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    page should contain element  div_free_req
    unselect frame