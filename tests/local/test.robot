*** Settings ***
Resource  ../../resource/testlink.robot
Library  OperatingSystem
Library  String
*** Variables ***
${HOSTNAME}  home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt
*** Test Cases ***

test

    ${TextFileContent}=    Get File  ip.txt
    Log    ${TextFileContent}
    ${ip}=	Get Line  ${TextFileContent}	0
    ${stripped}=	Strip String	${SPACE}${ip}${SPACE}
    open browser  http://${stripped}/testlink-code  ff
    Title Should Be  TestLink

    close browser