*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanManagementName}
...             AND         testlink.Create Build with name ${buildName}
...             AND         testlink.Create Test Suite
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseNameNew} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName1} in ${testSuiteName}
...             AND         testlink.Add Test Case To the Test Plan
...             AND         testlink.Execute Test
...             AND         testlink.Keywords
...             AND         testlink.go to index page

Test Teardown  Run keywords         testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 testlink.Check that test has been deleted
...             AND                 Close browser

*** Variables ***

${newTestProjectName}               SasaProject
${newTestProjectPrefix}             SasaPrefix
${testSuiteName}                    suiteSasa
${testDescription}                  Descriptiondescription
${testCaseNameNew}                  testCaseSasa
${testCaseName1}                    testCaseSasa1
${testCaseName}                     testCaseSasa2
${TestPlanManagementName}           NewPlanSasa
${TestPlanManagementDescription}    NewDescriptionSasa
${buildName}                        buildNameSasa
${Description}                      Descriptione
${KeywordName}                      key


*** Test Cases ***

Delete test case
    desktopPage.Go to Test Specification (mainframe)
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Delete Test Case ${testCaseName}
    testSpecificationPage.Select test case ${testCaseNameNew} node and click action button
    testSpecificationPage.Delete Test Case ${testCaseNameNew}
    testSpecificationPage.Select test case ${testCaseName1} node
    testSpecificationPage.Delete Test Step

