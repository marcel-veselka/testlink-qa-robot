*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanManagementName}
...             AND         testlink.Create Build with name ${buildName}
...             AND         testlink.Create Test Suite
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseNameNew} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName1} in ${testSuiteName}




Test Teardown  Run keywords         testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 testlink.Check that test has been deleted
...             AND                 Close browser

*** Variables ***

${newTestProjectName}               ProjectSasa
${newTestProjectPrefix}             PrefixSasa
${testSuiteName}                    SasaSuite
${testDescription}                  Descriptiondescription
${testCaseNameNew}                  SasaTestCase
${testCaseName1}                    SasaTestCase1
${testCaseName}                     SasaTestCase2
${TestPlanManagementName}           SasaPlan
${TestPlanManagementDescription}    NewDescriptionSasa
${buildName}                        SasaBuildName
${Description}                      Descriptione



*** Test Cases ***

Execute Test
    testlink.Execute Test Suite
