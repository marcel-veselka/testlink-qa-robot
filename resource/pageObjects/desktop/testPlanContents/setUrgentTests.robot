*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.

Library        Selenium2Library


*** Variables ***

*** Keywords ***

Select by Filter ${filter} from ${dropBox}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//ul[//a/span[.="${dropBox}"]]
    click element  xpath=//div[a/span[.="${dropBox}"]]/a
    click element  xpath=//div[a/span[.="${dropBox}"]]//li[.="${filter}"]
    wait until page contains element  expand_tree
    wait until page contains element  collapse_tree
    unselect frame

Check The Result ${testSuiteName} for Selection
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//span[contains(text(),"${testSuiteName}") ]
    page should contain element  xpath=//span[contains(text(),"${testSuiteName}") ]
    unselect frame

Set Urgency to Test Suite
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  high_urgency
    wait until page contains  Set all Test suite urgency:
    xpath should match x times  //td[contains(text(),"Medium")]  2
    click element  high_urgency
    wait until page contains element  xpath=//td[contains(text(),"High")]
    page should contain element  xpath=//td[contains(text(),"High")]
    wait until page contains element  xpath=//td[span[.="High"]]/input[@checked="checked"]
    page should contain element  xpath=//td[span[.="High"]]/input[@checked="checked"]
    xpath should match x times  //td[contains(text(),"Medium")]  1
    unselect frame

Set Urgency to Test Case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//input[@value="Set urgency for individual testcases"]
    click element  xpath=//input[@value="Set urgency for individual testcases"]
    wait until page contains element  xpath=//input[@value="Set urgency for individual testcases"]
    wait until page contains element  xpath=//td[span[.="High"]]/input[@checked="checked"]
    click element  xpath=//td[span[.="Low"]]/input
    click element  xpath=//input[@value="Set urgency for individual testcases"]
    wait until page contains element  xpath=//td[contains(text(),"Low")]
    wait until page contains element  xpath=//td[contains(text(),"Medium")]
    wait until page contains element  xpath=//td[span[.="Low"]]/input[@checked="checked"]
    page should contain element  xpath=//td[span[.="Low"]]/input[@checked="checked"]
    page should not contain element  xpath=//td[span[.="High"]]/input[@checked="checked"]
    unselect frame