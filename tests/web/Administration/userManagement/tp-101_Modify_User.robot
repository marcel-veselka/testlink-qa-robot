*** Settings ***
Documentation  A test case for succesful login as admin with correct login info
Resource       ../../../../resource/testlink.robot
Test Teardown  Close browser

*** Variables ***
${login}  vojta.svoboda
${fname}  karel
${lname}  karel
${email}  email@email.com

*** Test Cases ***
Edit user test case
    testlink.Login as admin correct
    testlink.Start editing user
    testlink.Edit user
# zkuska