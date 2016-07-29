*** Settings ***
Documentation  Test Suite with several Test Cases that checks creating a relation between requirement and test case
...            and assigning/unassigning any available requirement for test cases.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot

Test Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser
*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           requirementsRelations
${newTestProjectPrefix}         requi
${dokumentID}                   newdokumentid47
${title}                        newtitle47
${dokumentID1}                  newdokumentid48
${title1}                       newtitle48

*** Test Cases ***

47 Assign Requirements

    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID} ${title}
    Choose Requirement Specification ${dokumentID} ${title}
    Create Requirement Operations ${dokumentID} ${title}
    Create Test Case From Requirement ${dokumentID} ${title}
    Change Test Project and go to ${assignRequirements} ${checkAssignRequirements}
    Select Test Suite ${title}
    Assign Requirements ${dokumentID} ${title}
    Check Assigned Requirements ${title}

48 Relations between requirements and test cases
    [Tags]  48
    Preconditions for tc48
    Change Test Project and go to ${assignRequirements} ${checkAssignRequirements}
    Select Test Suite ${title1}
    Assign Requirements ${dokumentID1} ${title1}
    Check Assigned Requirements ${title1}
    Change Test Project and go to ${assignRequirements} ${checkAssignRequirements}
    Select Test Suite ${title1}
    Unassign Requirements ${title1}
    Check Availiable Requirements

*** Keywords ***

Preconditions for tc48
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID1} ${title1}
    Choose Requirement Specification ${dokumentID1} ${title1}
    Create Requirement Operations ${dokumentID1} ${title1}
    Create Test Case From Requirement ${dokumentID1} ${title1}

