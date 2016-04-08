*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${suite1} in test project ${newTestProjectName}
...             AND         testlink.Create test suite ${suite2} in test project ${newTestProjectName}
...             AND         testlink.Create test suite ${suite3} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${tc1} in ${suite2}
...             AND         testlink.Create test case ${tc2} in ${suite2}

Test Teardown  testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}

*** Variables ***
${newTestProjectName}  superProject
${newTestProjectPrefix}  super
${newTestProjectDescription}  superDesctiption
${suite1}  suite1
${suite2}  suite2
${suite3}  suite3
${tc1}  tc1
${tc2}  tc2

*** Test Cases ***
Drag drop
    testlink.Login as admin correct
    headerPage.Go to index page and change testproject
    desktopPage.Go to link Test Specification
    testSpecificationPage.I am here
    testSpecificationPage.Move suite ${suite1} to suite ${suite3}
    testSpecificationPage.Move suite ${suite2} to suite ${suite3}
    Check this testcase structure after movement

*** Keywords ***
Check this testcase structure after movement
    testSpecificationPage.Expand tree
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"suite3")]/ul/li[contains(.,"suite1")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"suite3")]/ul/li[contains(.,"suite2")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"suite3")]/ul/li[contains(.,"suite2")]/ul/li[contains(.,"tc1")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"suite3")]/ul/li[contains(.,"suite2")]/ul/li[contains(.,"tc2")]
    unselect frame




