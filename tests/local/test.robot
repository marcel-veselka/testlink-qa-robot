*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
*** Test Cases ***

test
    open browser  http://localhost/testlink-code/login.php  ff
    Title Should Be  TestLink
    close browser