*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library

*** Keywords ***

Modify name and type of Issue Tracker ${NewNameOfIssueTracker}
    select frame  mainframe
    wait until page contains element  name
    wait until page contains element  type
    wait until page contains element  create
    clear element text  name
    input text  name  ${NewNameOfIssueTracker}
    select from list by value  type  2
    click element  create
    unselect frame