*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot

Test Teardown  Run keywords  testlink.Delete Custom Field
...            AND           Close browser

*** Variables ***
${CFNAME}   DEFCUS
${CFLABEL}  FIELD
*** Test Cases ***
Create new Custom Field

    testlink.Login as admin correct
    testlink.Start creating Define Custom Fields

