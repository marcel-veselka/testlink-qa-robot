*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords        testlink.Create new Test Project
...             AND             headerPage.Go to index page and change testproject
...             AND             testlink.Create test suite ${suite1} in test project ${newTestProjectName}
...             AND             testlink.Create test suite ${suite2} in test project ${newTestProjectName}
...             AND             testlink.Create test suite ${suite3} in test project ${newTestProjectName}
...             AND             testlink.Create test case ${tc1} in ${suite2}
...             AND             testlink.Create test case ${tc2} in ${suite2}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***
${newTestProjectName}  testProject82
${newTestProjectPrefix}  tp82
${newTestProjectDescription}  Description82
${suite1}  tsuite82
${suite2}  tsuite82_1
${suite3}  tsuite82_2
${tc1}  tc82
${tc2}  tc82_1

*** Test Cases ***
Drag drop
    headerPage.Go to index page and change testproject
    desktopPage.Go to link Test Specification
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Move suite ${suite1} to suite ${suite3}
    testSpecificationPage.Move suite ${suite2} to suite ${suite3}
    wait until keyword succeeds  1min  0  Check this testcase structure after movement

*** Keywords ***
Check this testcase structure after movement
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${suite1}
    wait until page contains  ${suite2}
    wait until page contains  ${suite3}
    wait until page contains  ${tc1}
    wait until page contains  ${tc2}
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite1}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite2}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite2}")]/ul/li[contains(.,"${tc1}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite2}")]/ul/li[contains(.,"${tc2}")]
    unselect frame







