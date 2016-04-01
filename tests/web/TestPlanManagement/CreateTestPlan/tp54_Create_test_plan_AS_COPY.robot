*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TPMName}
...             AND          testlink.Delete Test Plan Management  ${TPMName2}
#...            AND           Close browser


*** Variables ***

${TPMName}  TestplanNumberOne
${TPMName2}  TestplanNumbertwoCOPY
${TPMDescription}  DescriptionDescription

*** Test Cases ***

Create new test plan

     testlink.Login as admin correct
     testlink.Create New Test Plan Management
     testlink.Create Test Plan Management AS COPY


