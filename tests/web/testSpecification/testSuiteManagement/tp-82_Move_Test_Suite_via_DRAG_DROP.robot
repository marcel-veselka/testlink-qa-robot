*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords        testlink.Create new Test Project
...             AND             headerPage.Go to index page and change testproject
...             AND             testlink.Create test suite ${suite1} in test project ${newTestProjectName}
...             AND             testlink.Create test suite ${suite2} in test project ${newTestProjectName}
...             AND             testlink.Create test suite ${suite3} in test project ${newTestProjectName}
...             AND             testlink.Create test case ${tc1} in ${suite2}
...             AND             testlink.Create test case ${tc2} in ${suite2}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***
${newTestProjectName}  superProject
${newTestProjectPrefix}  super
${newTestProjectDescription}  superDesctiption
${suite1}  suite1
${suite2}  suite2
${suite3}  suite3
${tc1}  tc1
${tc2}  tc2

*** Test Cases ***
Drag drop
    headerPage.Go to index page and change testproject
    desktopPage.Go to link Test Specification
    testSpecificationPage.I am here
    testSpecificationPage.Move suite ${suite1} to suite ${suite3}
    testSpecificationPage.Move suite ${suite2} to suite ${suite3}
    testlink.Check this testcase structure after movement







