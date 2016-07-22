*** Settings ***
Library  Selenium2Library
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem
Library  BuiltIn
Library  String
Library  XML
Resource  DevKey.robot

# pybot Project/Project.robot
*** Variables ***

${ReportsPath}  tests/api/Reports/
${xmlssaved}    tests/api/xmls/

*** Keywords ***


Create Test Project - all filled in ${prefix} ${testprojectname}
    [Documentation]   test same as is in the Testlink - tp-7:Create FIRST Test Project - TEMPLATE OFF
                 ...  at first, change xml and rewrites 2 variables (project name and project prefix)
                 ...  then sends xml to the tested page and saves xml report

################CHANGES DEV KEY####################
    DevKey.Change DevKey from file ${xmlssaved}CreateProject.xml to Key ${DevKey}

####changing xml variables########
  ${xml}=  get file  ${xmlssaved}CreateProject.xml
  ${Projectprefix}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testcaseprefix"]/value/string
  ${Projectname}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testprojectname"]/value/string
  ${newxml}=  replace string  ${xml}  ${Projectname}  ${testprojectname}
  ${newxml2}=  replace string  ${newxml}  ${Projectprefix}  ${prefix}
  save xml  ${newxml2}  ${xmlssaved}CreateProject.xml

#####sending xml########
   Create Session  httpbin  ${session}
   ${TextFileContent}=    OperatingSystem.Get File  ${xmlssaved}CreateProject.xml
   Log    ${TextFileContent}
   ${resp}=  Post Request  httpbin  /post  data=${TextFileContent}  # headers=${headers}

######creating report and validate if the test has passed######
   Create File	${ReportsPath}XMLreportCreateProject.xml	 ${resp.content}
   should contain  ${resp.content}     Success!
    sleep  1


Get TestProjectID

    ${ProjectId}=	Get Element Text	${ReportsPath}XMLreportCreateProject.xml   	params/param/value/array/data/value/struct/member[name="id"]/value/string



Delete Project with prefix ${prefix}
  [Documentation]  test same as is in the Testlink - tp-17:Delete EMPTY Test Project
              ...  Can be used on every Project, does not matter what the project got in
              ...  Must be specified prefix of the project that you want to delete


    ################CHANGES DEV KEY####################
    DevKey.Change DevKey from file ${xmlssaved}DeleteProject.xml to Key ${DevKey}

  # ${newxml}=  get Element text	 DeleteProject.xml	params/param/value/struct/member[name="prefix"]
 #  ${newxml2}=  Remove element  	DeleteProject.xml	 params/param/value/struct/member[name="prefix"]/value/string
  # ${outstr}=  Catenate  SEPARATOR=""   @{newxml2}
  #  Create File	 ${ReportsPath}testik.xml	 ${outstr}

  ${xml}=  get file  ${xmlssaved}DeleteProject.xml
  ${ProjectId}=  get element text  	 ${xml}	 params/param/value/struct/member[name="prefix"]/value/string
  ${newxml}=  replace string  ${xml}  ${ProjectId}  ${prefix}
  save xml  ${newxml}  ${xmlssaved}DeleteProject.xml


    Create Session  httpbin  ${session}
   ${TextFileContent}=    OperatingSystem.Get File  ${xmlssaved}DeleteProject.xml
   Log    ${TextFileContent}


   ${resp}=  Post Request  httpbin  /post  data=${TextFileContent}  # headers=${headers}
   Create File	${ReportsPath}XMLreportDelete.xml	 ${resp.content}
   should contain  ${resp.content}     status
   should contain  ${resp.content}     1


Get Projects

################CHANGES DEV KEY####################
    DevKey.Change DevKey from file ${xmlssaved}GetProjects.xml to Key ${DevKey}


   Create Session  httpbin  ${session}
   ${TextFileContent}=    OperatingSystem.Get File  ${xmlssaved}GetProjects.xml
   Log    ${TextFileContent}

   ${resp}=  Post Request  httpbin  /post  data=${TextFileContent}  # headers=${headers}
   Create File	${ReportsPath}XMLreportGetProjects.xml	 ${resp.content}
