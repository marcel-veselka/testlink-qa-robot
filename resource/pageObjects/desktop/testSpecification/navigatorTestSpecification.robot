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
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    wait until page contains element  name=expand_tree
    wait until page contains element  name=collapse_tree
    page should contain element  xpath=//*[@id="extdd-4"]/a
    unselect frame

Delete Test Case
    select frame  mainframe
    select frame  treeframe
    click element  xpath=//*[@id="extdd-4"]/a
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=/html/body/div/img[2]
    click element  xpath=/html/body/div/img[2]
    wait until page contains element  name=create_tc
    wait until page contains element  name=move_testcases_viewer
    wait until page contains element  name=delete_testcases
    wait until page contains element  name=reorder_testcases
    unselect frame
    select frame  mainframe
    select frame  workframe
    click element  name=delete_testcases
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=do_delete_testcases
    click element  name=tcaseSet[]
    unselect frame
    select frame  mainframe
    select frame  workframe
    click button  xpath=//*[@id="delete_testcases"]/div[2]/input
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  All Test Cases have been deleted
    unselect frame




