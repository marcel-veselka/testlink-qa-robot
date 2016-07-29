*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

Assign Custom Fields
    select frame  mainframe
    click element  xpath=//tr[contains(.,"${CFNAME}")]//td/input[@type="checkbox"]
    click element  xpath=//input[@name="doAssign"]
    unselect frame

Check Custom Field Was Assigned
    select frame  mainframe
    wait until page contains  Assigned custom fields
    wait until page contains element  xpath=//tbody[tr[contains(.,"${CFNAME}")]]
    unselect frame
