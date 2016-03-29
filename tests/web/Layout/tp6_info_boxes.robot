*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot


*** Test Cases ***
#Info Boxes
   # testlink.Login as admin correct



   # Open Browser To Login Page
    #Login as Admin
    #Submit Credentials
   # Change Test Project
   # Check info
   # [Teardown]  close browser
