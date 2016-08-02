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
    wait until page contains element  xpath=//h1[text()="Event viewer"]
    wait until page contains element  xpath=//legend[text()="Log level"]
    wait until page contains element  xpath=//legend[text()="User (Default All)"]
    wait until page contains element  xpath=//legend[text()="Timestamp"]
    wait until page contains element  tl_table_eventviewer
    unselect frame