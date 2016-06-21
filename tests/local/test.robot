*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
*** Test Cases ***

test
    open browser  http://localhost/testlink-code  ff
    Title Should Be  TestLink
    close browser