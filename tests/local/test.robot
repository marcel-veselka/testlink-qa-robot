*** Settings ***
Resource  ../../resource/testlink.robot

*** Variables ***
${HOSTNAME}  ip.txt
*** Test Cases ***

test
    open browser  http://${HOSTNAME}/testlink-code  ff
    Title Should Be  TestLink

    close browser