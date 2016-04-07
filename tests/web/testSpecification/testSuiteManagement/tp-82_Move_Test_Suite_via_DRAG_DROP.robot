*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

*** Variables ***
${newTestProjectName}  superProject
${newTestProjectPrefix}  super
${newTestProjectDescription}  superDesctiption


*** Keyword ***
Drag drop
    testlink.Create new Test Project
    select frame  name=titlebar
    wait until page contains element  xpath=//select[@name="testproject"]
    select from list by label  xpath=//select[@name="testproject"]  ${newTestProjectPrefix}:${newTestProjectName}
    unselect frame

Create test suite ${testSuiteName} in test project ${newTestProjectName}
    headerPage.Go to Index Page
    headerPage.Go to Test Specification (titlebar)
    navigatorTestSpecification.I am here
    select frame  mainframe
    select frame  treeframe
    click element  expand_tree
    wait until page contains element  xpath=//a[contains(.,"${newTestProjectName} (")]
    double click element  xpath=//a[contains(.,"${newTestProjectName} (")]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  new_testsuite
    click element  new_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name
    wait until page contains element  add_testsuite_button
    input text  name  ${testSuiteName}
    click element  add_testsuite_button
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  Test Suite created
    unselect frame

Create test case ${testCaseName} in ${testSuiteName}
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click element  expand_tree
    wait until page contains  ${testSuiteName}
    click element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName}")]/div/a
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  create_tc
    click element  create_tc
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  testcase_name
    wait until page contains element  do_create_button
    input text  testcase_name  ${testCaseName}
    click element  do_create_button
    unselect frame

    #xpath should match x times  //ul/li/ul/li[contains(.,"suite1")]/ul/li  2
    #xpath should match x times  //ul/li/ul/li[contains(.,"AnyOther")]/ul/li  0
    #drag and drop  xpath=//ul/li/ul/li[contains(.,"suite1")]/div/img[2]  xpath=//ul/li/ul/li[contains(.,"AnyOther")]/div/img[2]
   # element should be enabled




