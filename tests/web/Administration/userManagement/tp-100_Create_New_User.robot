*** Settings ***
#Documentation  A test case for succesful login as admin with correct login info
#Resource       ../../../../resource/testlink.robot
#Test Teardown  Close browser

*** Variables ***
${login}  vojta.svoboda
${fname}  Vojtěch
${lname}  Svoboda
${pass}  vojta123
${email}  vojtech.svoboda@tesena.com

*** Test Cases ***


#Create new user test case
    #testlink.Login as admin correct
    #testlink.Start creating new user
    #testlink.Fill all info about user and submit
    #testlink.Check that user exists
