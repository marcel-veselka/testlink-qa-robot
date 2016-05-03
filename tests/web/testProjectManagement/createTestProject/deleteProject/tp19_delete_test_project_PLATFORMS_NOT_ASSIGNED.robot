*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource  ../../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Platform ${PlatformName}

Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser

*** Variables ***
${newTestProjectName}  testProject19
${newTestProjectPrefix}  tp19
${newTestProjectDescription}  DesctiptioneOfTestProject19
${PlatformName}  Platform19
${TestPlanName}  testPlan19
${TestPlanDescription}  DescriptionOfTestPlan19

*** Test Cases ***

Delete Test Project No Platfroms Assigned
     testlink.Check There Is No Platforms Assigned
