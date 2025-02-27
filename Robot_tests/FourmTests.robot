*** Settings ***
Documentation    This Data driven test for a Fourm
Resource         resource.robot
Library          DataDriver    file=testdata_excel.xlsx    sheet_name=testdata

*** Test Cases ***
Fourm Test
    [Template]    Fourm Test Template
    Placeholder Step

*** Keywords ***
Fourm Test Template
    [Arguments]    ${FirstName}    ${LastName}    ${Hobby}    ${Age}
    Open Browser to Fourm Page
    A form should be displayed
    Enter First Name    ${FirstName}
    Enter Last Name    ${LastName}
    Enter Age    ${Age}
    Select Hobby    ${Hobby}
    Select Submit Button
    Verify Suceccful message is displayed
    Check Console Output    Submitted Data {"firstName": "${FirstName}","lastName": "${LastName}","age": "${Age}","hobby": "${Hobby}"}
    [Teardown]    Close Browser