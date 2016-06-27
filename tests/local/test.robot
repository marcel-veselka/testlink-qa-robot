*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
*** Test Cases ***

test
    open browser  http://52.22.60.255/32/home/travis/build/marcel-veselka/testlink-qa-robot/testlink-code/login.php  ff
    Title Should Be  TestLink
    close browser