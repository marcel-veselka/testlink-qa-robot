*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create New Version Of TC
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Platform ${PlatformName}
...             AND         testlink.Add Platform to Test Plan
...             AND         testlink.Create Build with name ${buildName}
...             AND         testlink.Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
...             AND         testlink.Keywords
...             AND         testlink.Start creating Define Custom Fields
...             AND         headerPage.go to index page

Test Teardown  Run keywords    testlink.Delete Custom Field
...             AND             close browser

*** Variables ***

${newTestProjectName}           testProject20
${newTestProjectPrefix}         tp20
${newTestProjectDescription}    DesctiptioneOfTestProject20
${testSuiteName}                tsuite20
${testCaseName}                 tc20
${TestPlanName}                 testPlan20
${TestPlanDescription}          DescriptionOfTestPlan20
${PlatformName}                 Platform20
${buildName}                    buildName20
${buildDescription}             DescriptionOfBuild20
${Username}                     renat.kulalov
${KeywordName}                  key20
${CFNAME}                       fieldName20
${CFLABEL}                      fieldLabel20

#pybot -d results tests\web\testProjectManagement\createTestProject\deleteProject\tp20_delete_test_project_WORST_CASE.robot

*** Test Cases ***

Delete test project WORST CASE
    [Tags]  control2
    testlink.Assign Custom Fields
    testlink.Check Keyword Exists
    testlink.Check there is platform assigned
    testlink.Check Custom Fields Are Visible
    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
    testlink.Check that test has been deleted
