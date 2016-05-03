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
Select platform ${PlatformName}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    click element  xpath=//*[@id="settings"]/table/tbody/tr[2]/td[2]/div
    wait until page contains   ${PlatformName}
    click element  xpath=//*[@id="settings"]/table/tbody/tr[2]/td[2]/select/option[.='${PlatformName}']
    unselect frame

Select User ${Username}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  xpath=//*[@id="the-table-1"]/thead/tr/th/img
    click element  id=bulk_tester_div_chosen
    input text  xpath=//*[@id="bulk_tester_div_chosen"]/ul/li/input  ${Username}
    click button  bulk_user_assignment
    click button  doActionButton
    unselect frame

I am here
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains element  xpath=//span[contains(text(),"Settings")]
    wait until page contains element  xpath=//span[contains(text(),"Filters")]
    wait until page contains element  xpath=//input[@value="Apply"]
    wait until page contains element  xpath=//input[@value="Reset Filters"]
    wait until page contains element  xpath=//input[@value="Advanced Filters"]
    wait until page contains element  xpath=//input[@value="Expand tree"]
    wait until page contains element  xpath=//input[@value="Collapse tree"]
    wait until page contains element  tree_div
    unselect frame

Select Test Suite From The Tree ${testSuiteName}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//span[text()="${testSuiteName} (1)" ]
    click element  xpath=//span[text()="${testSuiteName} (1)" ]
    unselect frame

Check Test Cases Assigned Correctly ${Username} ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[td[contains(.,"${Username}")]][td[text()="${PlatformName}"]]
    unselect frame

Check there is no assigned TC ${testSuiteName}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    page should not contain element  xpath=//span[text()="${testSuiteName} (1)" ]
    unselect frame

Check Updated Version of TC ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[td[contains(.,"1")]][td[contains(.,"${testCaseName}")]]
    page should contain element  xpath=//tr[td[contains(.,"1")]][td[contains(.,"${testCaseName}")]]
    unselect frame

