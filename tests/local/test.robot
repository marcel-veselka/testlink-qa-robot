*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
*** Keywords ***
test
    open browser  http://localhost/testlink-code  ff
    Title Should Be  TestLink
    close browser