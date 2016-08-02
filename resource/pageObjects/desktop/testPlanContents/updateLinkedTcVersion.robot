*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${xpathInputBtn}  xpath=//input[@id="update_btn"]
${buttonDoBulk}   doBulkUpdateToLatest

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
    wait until page contains element  xpath=//span[contains(text(),"${testSuiteName}") ]
    click element  xpath=//span[contains(text(),"${testSuiteName}") ]
    unselect frame

Check Version Of The TC ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[td[contains(.,"${testCaseName}")]][td[contains(.,"2")]][td/select]
    wait until page contains element  xpath=//tr[td[contains(.,"${testCaseName}")]]//input[@type="checkbox"]
    wait until page contains element  ${xpathInputBtn}
    unselect frame

Update to new version ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  xpath=//tr[td[contains(.,"${testCaseName}")]]//input[@type="checkbox"]
    select from list by label  xpath=//tr[td[contains(.,"${testCaseName}")]]//select  1
    click element  ${xpathInputBtn}
    unselect frame

Check changed TC Version ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[td[contains(.,"${testCaseName}")]][td[contains(.,"1")]][td/select]
    page should contain element  xpath=//tr[td[contains(.,"${testCaseName}")]][td[contains(.,"1")]][td/select]
    unselect frame

Update New Version of Test Case
    wait until keyword succeeds  1min  0  updateLinkedTcVersion.I am here
    updateLinkedTcVersion.Select Test Suite From The Tree ${testSuiteName}
    wait until keyword succeeds  1min  0  updateLinkedTcVersion.Check Version Of The TC ${testCaseName}
    updateLinkedTcVersion.Update to new version ${testCaseName}

UpdateLinkedTcVersion Check TC Was Changed
    wait until keyword succeeds  1min  0  updateLinkedTcVersion.I am here
    updateLinkedTcVersion.Select Test Suite From The Tree ${testSuiteName}
    wait until keyword succeeds  1min  0  updateLinkedTcVersion.Check changed TC Version ${testCaseName}

### Method for checking function of Bulk Update to latest version button, which updates all TCs in test suite at once ###
Bulk Update to latest version
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${buttonDoBulk}
    click element  ${buttonDoBulk}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathInputBtn}
    click element  ${xpathInputBtn}
    unselect frame

### Control that Bulk Update to latest version method worked correctly as it must ###
Check all Tests were Linked to latest version
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  All linked Test Case Versions are current
    unselect frame