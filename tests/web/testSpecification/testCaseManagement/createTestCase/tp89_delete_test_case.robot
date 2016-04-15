*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Build with name ${buildName}
...             AND         testlink.Create Test Suite
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName2} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName3} in ${testSuiteName}
...             AND         testlink.Add Test Case To the Test Plan
...             AND         testlink.Execute Test
...             AND         testlink.Keywords

Test Teardown  Run keywords         testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 testlink.Check that test has been deleted
...             AND                 Close browser

*** Variables ***

${newTestProjectName}               testProject89
${newTestProjectPrefix}             tp89
${testSuiteName}                    tsuite89
${testDescription}                  DescriptionOfTest89
${testCaseName}                     tc89
${testCaseName2}                    tc89_1
${testCaseName3}                    tc89_2
${TestPlanName}                     testPlan89
${TestPlanDescription}              DescriptionOfTestPlan89
${buildName}                        buildName89
${buildDescription}                 DescriptionOfBuild89
${KeywordName}                      key89


*** Test Cases ***

Delete test case
    testlink.go to index page
    desktopPage.Go to Test Specification (mainframe)
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Delete Test Case ${testCaseName}
    testSpecificationPage.Select test case ${testCaseName2} node and click action button
    testSpecificationPage.Delete Test Case ${testCaseName2}
    testSpecificationPage.Select test case ${testCaseName3} node
    testSpecificationPage.Delete Test Step

