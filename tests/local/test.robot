*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
*** Test Cases ***

test
    open browser  http://52.22.60.255/32/testlink-code/  ff
    Title Should Be  TestLink
    close browser