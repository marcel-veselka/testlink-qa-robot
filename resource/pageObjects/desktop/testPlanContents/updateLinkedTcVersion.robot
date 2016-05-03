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

Check Version Of The TC ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[td[contains(.,"${testCaseName}")]][td[contains(.,"2")]][td/select]
    wait until page contains element  xpath=//tr[td[contains(.,"${testCaseName}")]]//input[@type="checkbox"]
    wait until page contains element  xpath=//input[@id="update_btn"]
    unselect frame

Update to new version ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  xpath=//tr[td[contains(.,"${testCaseName}")]]//input[@type="checkbox"]
    select from list by label  xpath=//tr[td[contains(.,"${testCaseName}")]]//select  1
    click element  xpath=//input[@id="update_btn"]
    unselect frame

Check TC Version was changed ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    page should not contain element  xpath=//tr[td[contains(.,"${testCaseName}")]][td[contains(.,"2")]][td/select]
    wait until page contains element  xpath=//tr[td[contains(.,"${testCaseName}")]][td[contains(.,"1")]][td/select]
    page should contain element  xpath=//tr[td[contains(.,"${testCaseName}")]][td[contains(.,"1")]][td/select]
    unselect frame

