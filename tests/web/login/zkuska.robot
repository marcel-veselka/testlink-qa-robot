*** Settings ***

Library  Selenium2Library

*** Variables ***
#${BROWSER} =  ff

*** Test Cases ***
zkuska
    open browser  http://testlab.tesena.com/testlink  ff
    #input text  login  automation.tester
    #input text  tl_password  autoTest!@#
    input text  login  renat.kulalov
    input text  tl_password  renat123
    Click Button  login_submit
    sleep  5
    Execute Javascript    setTimeout(function(){window.open('lib/cfields/cfieldsView.php')},200);
    sleep  5
    select window  new
    Click Button  create_cfield
    input text  cf_name  tester
    input text  cf_label  testEngineer
    Click Button  do_update
    wait until page contains  tester
    sleep  5
    close browser

#pybot -d ownersManual/Results  ownersManual/tests