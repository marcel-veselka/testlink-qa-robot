*** Settings ***
Documentation  A test case for succesful login as admin with correct login info
Resource       ../../../pageObjects/loginPageJan.robot

*** Test Cases ***
Login as admin correct
    loginPageJan.Open Browser To Login Page
    loginPageJan.Wait until page contains all elements for login
    loginPageJan.Fill correct credentials and submit
    loginPageJan.Check there is no warning about login
    loginPageJan.Close the browser

Login as admin incorrect
    loginPageJan.Open Browser To Login Page
    loginPageJan.Wait until page contains all elements for login
    loginPageJan.Fill incorrect credentials and submit
    loginPageJan.Check there is a warning about login
    loginPageJan.Close the browser