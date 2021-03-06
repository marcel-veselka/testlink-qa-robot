*** Settings ***

Documentation  Testing searching engine testing 3 values, searching by: ID, Title and keyword

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot

Suite Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND             Create New Test Plan ${TestPlanName}
...             AND             Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND             Create test case ${testCaseName} in ${testSuiteName}
...             AND             Create single Keyword ${testCaseName}
...             AND             Assign Keyword using blue arrow


Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               KWProject
${newTestProjectPrefix}             KWmngmnt
${newTestProjectDescription}        Description
${testSuiteName}                    tsuite132
${suiteDescription}                 Description
${testDescription}                  testDescription
${testCaseName}                     tc132
${TestPlanName}                     Tesptplan132
${TestPlanDescription}              testPlandescriptionforCF
${AssignKeywords}                   Assign Keywords
${checkAssignKeywords}              keywordtest
${TestCaseID}                       TCID
${Title}                            name
${Keyword}                          ${checkAssignKeywords}


*** Test Cases ***

132 Search Test Cases

    Search by ${TestCaseID} ${testCaseName} with ${newTestProjectPrefix}-
    Search by ${Title} ${testCaseName} with ${testCaseName}
    Search by selecting Keyword ${Keyword}
