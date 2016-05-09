*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***



*** Keywords ***

I am here ASSIGN ROLES
    select frame  mainframe
    wait until page contains  Assign Test Plan roles
    wait until page contains element  xpath=//input[@name="do_update"]
    wait until page contains element  xpath=//tr[td[contains(text(), "automation.tester")]]//td/select
    wait until page contains element  xpath=//tr[td[contains(text(), "tester (tester tesena)")]]//td/select
    wait until page contains element  xpath=//tr[td[contains(text(), "vojta.svoboda")]]//td/select
    unselect frame

Assign Roles for TP
    select frame  mainframe
    select from list by value  xpath=//tr[td[contains(text(), "automation.tester")]]//td/select  9
    select from list by value  xpath=//tr[td[contains(text(), "tester (tester tesena)")]]//td/select  7
    select from list by value  xpath=//tr[td[contains(text(), "vojta.svoboda")]]//td/select  6
    click element  xpath=//input[@name="do_update"]
    unselect frame
    select frame  mainframe
    wait until page contains  User Roles updated
    page should contain  User Roles updated
    unselect frame

Check That Roles Were Chnanged
    select frame  mainframe
    list selection should be  xpath=//tr[td[contains(text(), "automation.tester")]]//td/select  9
    list selection should be  xpath=//tr[td[contains(text(), "tester (tester tesena)")]]//td/select  7
    list selection should be  xpath=//tr[td[contains(text(), "vojta.svoboda")]]//td/select  6
    unselect frame

