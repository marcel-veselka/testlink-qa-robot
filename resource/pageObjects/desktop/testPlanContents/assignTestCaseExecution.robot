*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.

Library        Selenium2Library


*** Variables ***

*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
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

AssignTCExecution Check TC Was Changed
    wait until keyword succeeds  1min  0  assignTestCaseExecution.I am here
    assignTestCaseExecution.Select Test Suite From The Tree ${testSuiteName}
    wait until keyword succeeds  1min  0  assignTestCaseExecution.Check Updated Version of TC ${testCaseName}

AssignTCExecution Check TC Was Corrected
    wait until keyword succeeds  1min  0  assignTestCaseExecution.I am here
    assignTestCaseExecution.Select Test Suite From The Tree ${testSuiteName}
    assignTestCaseExecution.Check Test Cases Assigned Correctly ${Username} ${PlatformName}