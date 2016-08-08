*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header
Library        Selenium2Library

*** Variables ***

${mySettings}               xpath=//img[@title="My Settings"]
${desktop}                  xpath=//img[@title="Project"]
${requirementSpec}          xpath=//img[@title="Requirement Specification"]
${testSpec}                 xpath=//img[@title="Test Specification"]
${testExecution}            xpath=//img[@title="Test Execution"]
${testReports}              xpath=//img[@title="Test Reports"]
${userManagement}           xpath=//img[@title="Users/Roles"]
${events}                   xpath=//img[@title="Events"]
${indexPage}                xpath=//img[@title="logo"]
${testProject}              xpath=//select[@name="testproject"]
${logout}                   xpath=//img[@title="Logout"]
${searchTC}                 xpath=//img[@title="Search Test Case by ID"]
${targetTC}                 targetTestCase

*** Keywords ***
I am here
    wait until page contains element  titlebar
    select frame  titlebar
    wait until page contains element  ${indexPage}
    wait until page contains element  ${mySettings}
    wait until page contains element  ${logout}
    wait until page contains element  ${desktop}
    wait until page contains element  ${testSpec}
    wait until page contains element  ${userManagement}
    wait until page contains element  ${events}
    wait until page contains element  ${targetTC}
    wait until page contains element  ${searchTC}
    wait until page contains element  ${testProject}
    unselect frame

I am here in full
    wait until keyword succeeds  1min  0  headerPage.I am here
    select frame  titlebar
    wait until page contains element  ${requirementSpec}
    wait until page contains element  ${testExecution}
    wait until page contains element  ${testReports}
    unselect frame

HeaderPage Go to ${link}
    #select frame  titlebar
    #wait until page contains element  ${indexPage}
    #click element  ${indexPage}
    #unselect frame
    wait until keyword succeeds  1min  0  headerPage.I am here
    select frame  titlebar
    click element  ${link}
    unselect frame

Choose test project from dropdown
    wait until page contains element  titlebar
    select frame  titlebar
    wait until page contains element  ${testProject}
    select from list by label  ${testProject}  ${newTestProjectPrefix}:${newTestProjectName}
    unselect frame

