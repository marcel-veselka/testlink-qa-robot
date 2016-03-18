*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header
Library        Selenium2Library



*** Variables ***
{@searchedTestCase}  =  4
{@testProjectName}  =  tp:testing project

*** Keywords ***

Check header is there
    page should contain element  xpath=//frame[@name="titlebar"]

Wait untill header is loaded
    wait until page contains  xpath=//img[@alt="Company logo"]
    wait until page contains  xpath=//img[@title="My Settings"]
    wait until page contains  xpath=//img[@title="Logout"]
    wait until page contains  xpath=//img[@title="Project"]
    wait until page contains  xpath=//img[@title="Requirement Specification"]
    wait until page contains  xpath=//img[@title="Test Specification"]
    wait until page contains  xpath=//img[@title="Test Execution"]
    wait until page contains  xpath=//img[@title="Test Reports"]
    wait until page contains  xpath=//img[@title="User Management"]
    wait until page contains  xpath=//img[@title="Events"]
    wait until page contains  targetTestCase
    wait until page contains  xpath=//img[@title="Search Test Case by ID"]
    wait until page contains  xpath=//select[@name="testproject"]

Click logo testlink
    click element  xpath=//img[@alt="Company logo"]

Click My Settings
    click element  xpath=//img[@title="My Settings"]

Click logout
    click element  xpath=//img[@title="Logout"]

Click project
    click element  xpath=//img[@title="Project"]

Click requirement specification
    click element  xpath=//img[@title="Requirement Specification"]

Click test specification
    click element  xpath=//img[@title="Test Specification"]

Click test execution
    click element  xpath=//img[@title="Test Execution"]

Click test reports
    click element  xpath=//img[@title="Test Reports"]

Click user management
    click element  xpath=//img[@title="User Management"]

Click events
    click element  xpath=//img[@title="Events"]

Input text into test case search
    input text  targetTestCase  {@searchedTestCase}

Start searching test case
    click element  xpath=//img[@title="Search Test Case by ID"]

Click test project dropdown
    click element  xpath=//select[@name="testproject"]

Choose test project from dropdown
    select from list by label  xpath=//select[@name="testproject"]  {@testProjectName}

