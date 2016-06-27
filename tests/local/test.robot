*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
*** Test Cases ***

test
    open browser  http://127.0.0.1/home/travis/build/marcel-veselka/testlink-qa-robot/testlink-code/testlink-code/login.php  ff
    Title Should Be  TestLink
    close browser