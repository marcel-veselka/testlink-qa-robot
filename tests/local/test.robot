*** Settings ***
Resource  ../../resource/testlink.robot
Library  OperatingSystem
*** Variables ***
${HOSTNAME}  home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt
*** Test Cases ***

test

    ${TextFileContent}=    Get File    home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt
    Log    ${TextFileContent}
    open browser  http://${TextFileContent}/testlink-code/login.php  ff
    Title Should Be  TestLink

    close browser