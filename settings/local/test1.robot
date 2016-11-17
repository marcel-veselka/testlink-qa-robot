*** Settings ***
Library  Selenium2Library
Library  OperatingSystem
Library  String
*** Variables ***
${HOSTNAME}  home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt
${BROWSER} =  internet explorer
${START_URL} =  http://skoda-recallactions-cdb.azurewebsites.net/000/en-GB
${REMOTE_URL} =  http://aleshkohen1:XbzpqLEskzeVjtCRNPdV@hub.browserstack.com/wd/hub
${DESIRED_CAPABILITIES} =  name:WIN8 + IE10, platform:WIN8,browserName:internet explorer,version:10
*** Test Cases ***

test

    ${TextFileContent}=    Get File  ip.txt
    log    ${TextFileContent}
    ${ip}=	Get Line  ${TextFileContent}	0
    ${stripped}=	Strip String	${SPACE}${ip}${SPACE}
    open browser  https://${stripped}/testlink-code  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    #open browser  https://www.google.com  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    maximize browser window
    title should be  TestLink
    capture page screenshot
    close browser