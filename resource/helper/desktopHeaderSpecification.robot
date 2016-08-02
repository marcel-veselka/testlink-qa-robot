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

Test Case ${testCaseName1} Add To Test Plan ${TestPlanName}
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Add TC ${testCaseName1} to the Test Plan ${TestPlanName}

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

Create single Keyword ${testCaseName}
    [Tags]  133
    Change Test Project and go to ${keywordManagement} ${keywordManagement}
    assignKeywords.Create Keyword
    assignKeywords.Check Keyword Was Created

Create New Keyword
    Change Test Project and go to ${keywordManagement} ${keywordManagement}
    assignKeywords.Create Keyword
    assignKeywords.Check Keyword Was Created

Create New Version Of TC ${testCaseName}
    [Tags]  tp78
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create New Version of TestCase ${testCaseName}

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

Leave fileds blanked ${testSuiteName1}, rename ${testSuiteName2} test suite ${testSuiteName3}
    [Tags]  tp81
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Test Suite ${testSuiteName3} select node
    testSpecificationPage.Click Actions button
    testSpecificationPage.Edit Test Suite ${testSuiteName1}
    testSpecificationPage.Controll Warning Message
    testSpecificationPage.Test Suite ${testSuiteName3} select node
    testSpecificationPage.Click Actions button
    testSpecificationPage.Edit Test Suite ${testSuiteName2}
    testSpecificationPage.Submit and check test suite ${testSuiteName2} was changed

Assign Keyword using blue arrow
    [Tags]  tp133
    Change Test Project and go to ${AssignKeywords} ${checkAssignKeywords}
    testSpecificationPage.Select test case ${testCaseName} node
    Assign Keywords single arrow and save

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

Search by selecting Keyword ${Keyword}
    searchTestCases.I am here
    searchTestCases.Click dropdown Keyword ${Keyword}
    Check TC ${testCaseName} was selected