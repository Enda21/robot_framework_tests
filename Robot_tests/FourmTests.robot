*** Settings ***
Documentation    This Data-driven test for a Forum
#Library          DataDriver    file=fourmTestData.xlsx    sheet_name=Sheet1
Resource         resource.robot

*** Test Cases ***
Fourm Test
    [Template]    Fourm Test Template
    John            Doe            Video Games  30
    Jane            Smith          Running      25
    Bob             Johnson        Cooking      40

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
    [Teardown]    Close Browser