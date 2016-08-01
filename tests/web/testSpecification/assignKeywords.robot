*** Settings ***

Documentation  There is just one test about assigning Keywords in the test specification using blue arrow

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot

Suite Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND             Create New Test Plan ${TestPlanName}
...             AND             Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND             Create test case ${testCaseName} in ${testSuiteName}
...             AND             Create single Keyword ${testCaseName}

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               KWProject
${newTestProjectPrefix}             KWmngmnt
${newTestProjectDescription}        Description
${testSuiteName}                    tsuite133
${suiteDescription}                 Description
${testDescription}                  testDescription
${testCaseName}                     tc133
${TestPlanName}                     Tesptplan133
${TestPlanDescription}              testPlandescriptionforCF
${AssignKeywords}                   Assign Keywords
${checkAssignKeywords}              keywordtest




*** Test Cases ***

133 Assign Keywords

    Assign Keyword using blue arrow
