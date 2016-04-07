*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${suite1} in test project ${newTestProjectName}
...             AND         testlink.Create test suite ${suite2} in test project ${newTestProjectName}
...             AND         testlink.Create test suite ${suite3} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${tc1} in ${suite2}
...             AND         testlink.Create test case ${tc2} in ${suite2}

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
    sleep  10
    close all browsers

    #xpath should match x times  //ul/li/ul/li[contains(.,"suite1")]/ul/li  2
    #xpath should match x times  //ul/li/ul/li[contains(.,"AnyOther")]/ul/li  0
    #drag and drop  xpath=//ul/li/ul/li[contains(.,"suite1")]/div/img[2]  xpath=//ul/li/ul/li[contains(.,"AnyOther")]/div/img[2]
   # element should be enabled




