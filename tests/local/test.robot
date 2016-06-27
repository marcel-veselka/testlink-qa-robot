*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
*** Test Cases ***

test
    open browser  http://10.128.0.45/testlink-code  ff
    Title Should Be  TestLink

    close browser