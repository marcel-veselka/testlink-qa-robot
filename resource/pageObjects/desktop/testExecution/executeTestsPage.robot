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
    select frame  name=treeframe
    wait until page contains element  xpath=//h1[text()="Execute Tests"]
    wait until page contains element  xpath=//span[contains(text(),"Settings")]
    wait until page contains element  xpath=//span[contains(text(),"Filters")]
    wait until page contains element  xpath=//input[@value="Apply"]
    wait until page contains element  xpath=//input[@value="Reset Filters"]
    wait until page contains element  xpath=//input[@value="Advanced Filters"]
    wait until page contains element  xpath=//input[@value="Expand tree"]
    wait until page contains element  xpath=//input[@value="Collapse tree"]
    wait until page contains element  tree_div
    unselect frame

Execute Test Case
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/textarea[@style="resize:both;"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div[@class="resultBox"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    input text  xpath=//div/form/div/table/tbody/tr/td/textarea[@style="resize:both;"]  New Description
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  p
    input text  execution_duration  1010
    click element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    wait until page contains element  xpath=//div/form/div/div[contains(text(),"Build")][contains(text(),"${buildName}")]
    page should contain element  xpath=//div/form/div/div[contains(text(),"Build")][contains(text(),"${buildName}")]
    unselect frame

Select test case ${testCaseName} node
    select frame  mainframe
    select frame  treeframe
    wait until page contains  ${testCaseName}
    wait until page contains element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    double click element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    unselect frame

Execute Test Case Passed
    executeTestsPage.Select test case ${testCaseName} node
    select frame  mainframe
    select frame  workframe
    xpath should match x times  //div/form/div/div/table/tbody/tr/td/select  2
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div[@class="resultBox"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@type="submit"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  p
    input text  execution_duration  1010
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[7]/td/select  p
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[10]/td/select  p
    unselect frame

Click on Save and move to next
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    click element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    unselect frame

Click on Save execution button
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    click element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    unselect frame

Check Move to Next Function ${testCaseName}
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div[contains(.,"${testCaseName}")]
    page should contain element  xpath=//div/form/div[contains(.,"${testCaseName}")]
    unselect frame


Check That Passed Test Was Saved
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//span[@class="light_passed"][contains(text(),"${testCaseName}")]
    page should contain element  xpath=//span[@class="light_passed"][contains(text(),"${testCaseName}")]
    unselect frame

Execute Test Case Failed
    executeTestsPage.Select test case ${testCaseName2} node
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/div/table/tbody/tr/td/select
    xpath should match x times  //div/form/div/div/table/tbody/tr/td/select  2
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div[@class="resultBox"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@type="submit"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  f
    input text  execution_duration  1010
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[7]/td/select  f
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[10]/td/select  f
    unselect frame


Check That Failed Test Was Saved
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//span[@class="light_failed"][contains(text(),"${testCaseName2}")]
    page should contain element  xpath=//span[@class="light_failed"][contains(text(),"${testCaseName2}")]
    unselect frame

Execute Test Case Blocked
    executeTestsPage.Select test case ${testCaseName3} node
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/div/table/tbody/tr/td/select
    xpath should match x times  //div/form/div/div/table/tbody/tr/td/select  2
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div[@class="resultBox"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@type="submit"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  b
    input text  execution_duration  1010
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[7]/td/select  b
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[10]/td/select  b
    unselect frame

Check That Blocked Test Was Saved
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//span[@class="light_blocked"][contains(text(),"${testCaseName3}")]
    page should contain element  xpath=//span[@class="light_blocked"][contains(text(),"${testCaseName3}")]
    unselect frame

Check Test Suite Status
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//span[contains(.,"${newTestProjectName} / ${TestPlanName}")][span[@class="light_passed"]][span[@class="light_failed"]][span[@class="light_blocked"]]
    page should contain element  xpath=//span[contains(.,"${newTestProjectName} / ${TestPlanName}")][span[@class="light_passed"]][span[@class="light_failed"]][span[@class="light_blocked"]]
    unselect frame