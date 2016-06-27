*** Settings ***
Resource  ../../resource/testlink.robot
Library  OperatingSystem
*** Variables ***
${HOSTNAME}  home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt
*** Test Cases ***

test

    ${TextFileContent}=    Get File  ip.txt
    Log    ${TextFileContent}
    open browser  ${TextFileContent}  ff
    Title Should Be  TestLink

    close browser