*** Settings ***
Library  Selenium2Library

Resource  ../../resource/helper/desktopHeaderHelper.robot
Resource  ../../resource/pageObjects/desktop/testSpecification/testSpecificationPage.robot
Resource  ../../resource/pageObjects/desktop/testSpecification/assignKeywords.robot
Resource  ../../resource/pageObjects/desktop/testSpecification/searchTestCases.robot

*** Variables ***

*** Keywords ***

Create test suite ${testSuiteName} in test project ${newTestProjectName}
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create TS ${testSuiteName} ${newTestProjectName}

Create test case ${testCaseName} in ${testSuiteName}
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create TC ${testSuiteName} in TS ${testCaseName}
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Select test case ${testCaseName} node
    testSpecificationPage.Create Step
    testSpecificationPage.Add Step after created first step

Add Test Suite to Test Plan
    [Tags]  91
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Add Test Cases to the Test Plan

Create Test Suite
    [Tags]  tp86
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Fill in the fields and create test suite

Keywords ${testCaseName}
    [Tags]  89
    Change Test Project and go to ${keywordManagement} ${keywordManagement}
    assignKeywords.Create Keyword
    assignKeywords.Check Keyword Was Created
    assignKeywords.Click Assign Keyword to Test Case
    testSpecificationPage.Select test case ${testCaseName} node
    assignKeywords.Assign Keywords

Create New Version Of TC
    [Tags]  tp78
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create New Version of TestCase

Add Test Case ${testCaseName} To the Test Plan ${TestPlanName}
    [Tags]  56
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Add To Test Plans ${TestPlanName}

Check Test Specification ${title}
    [Tags]  tp41_requirement_operation_creare_tc
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Add Filters Test Case Title Test Specification ${title}

Check Custom Fields Are Visible
    [Tags]  tp20
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Check Custom Fields

Controll Warning Message And Create Test Suite ${testSuiteName} ${testDescription}
    [Tags]  tp80
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create Test Suite Button
    testSpecificationPage.Controll Warning Message
    testSpecificationPage.Fill In The Fields ${testSuiteName} ${testDescription}

Move Copy Edit ${testSuiteName} ${suite2}
    [Tags]  tp81
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Test Suite ${testSuiteName} select node
    testSpecificationPage.Edit Test Suite ${suite2}
    testSpecificationPage.Test Suite ${suite2} select node
    testSpecificationPage.Copy Test Suite ${suite2}
    testSpecificationPage.Test Suite ${suite2} select node
    testSpecificationPage.Move Test Suite
    testSpecificationPage.Check Move And Copy Action ${suite2}




Create Step in test case: ${testCaseName}
    [Tags]  tp86
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Select test case ${testCaseName} node
    testSpecificationPage.Create Step

Check All Actions Buttons For Test Case ${testCaseName}
    [Tags]  tp90
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Print View Test Case
    Select Window  Print Test Case: ${testCaseName}
    wait until page contains  ${testCaseName}
    close window
    Select Window  TestLink 1.9.14 (Padawan)
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Create New Version
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Deactivate This Version
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Activate This Version

Show Execution History ${testCaseName}
    [Tags]  90
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Execution History
    select window  TestLink
    wait until page contains  ${testCaseName}
    close window
    Select Window  TestLink 1.9.14 (Padawan)

Check Keyword Exists
    [Tags]  tp20
    Change Test Project and go to ${keywordManagement} ${keywordManagement}
    assignKeywords.Check Keyword

Search by ${element} ${testCaseName} with ${text}
    HeaderPage Go to ${searchTC}
    searchTestCases.I am here
    Search TC by ${element} ${text}
    Check TC ${testCaseName} was selected
