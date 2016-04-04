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

Add Filters Test Case Title Test Specification

    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=filter_testcase_name
    wait until page contains element  name=doUpdateTree
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    click element  name=expand_tree
    page should contain element  xpath=//a[span[contains(text(),"${title} [1]")]]
    sleep  2
    click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  The Test Case was generated from the assigned requirement "${title}"
    unselect frame

Delete Test Case
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=filter_testcase_name
    wait until page contains element  name=doUpdateTree
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    page should contain element  xpath=//a[span[contains(text(),"${title} (")]]
    sleep  2
    click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=delete_testsuite
    click element  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    #wait until page contains element  xpath=//img[@title="check/uncheck all"]
    #click element  xpath=//img[@title="check/uncheck all"]
    wait until page contains element  name=delete_testsuite
    click button  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame




