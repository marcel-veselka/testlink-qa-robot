*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Teardown  close all browsers


*** Test Cases ***

Login
    testlink.Login as admin correct
    testlink.Login as admin incorrect
    testlink.Login as admin with empty password field


