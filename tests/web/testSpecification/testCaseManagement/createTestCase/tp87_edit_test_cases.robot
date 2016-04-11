*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create Test Suite
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}

Test Teardown  Run keywords         testlink.Go to index page
...             AND                 testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 testlink.Check that test has been deleted
...             AND                 Close browser

*** Variables ***

${newTestProjectName}  NewNamedProjectRen
${newTestProjectPrefix}  prfRen
${testSuiteName}    suiteRen
${testDescription}  testDescrRen
${testCaseName}     TCRen
${testCaseNameNew}  TCRen
${testCaseNameEdit}  TCRenEdit

*** Test Cases ***

Edit test case
    testSpecificationPage.Select test case ${testCaseNameNew} node and click action button
    testSpecificationPage.Edit Test Case

