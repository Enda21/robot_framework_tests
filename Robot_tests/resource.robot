*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary  run_on_failure=none
Library           Collections


*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          1
${CALL_BACK URL}   http://localhost:3000/
${FOURM_PAGE URL}  http://localhost:3000/forum
@{list_to_populate}    #   create empty list to populate with for-loop
${Red}=     RedCard
${Blue}=    BlueCard


*** Keywords ***
Open Browser to Card Page
    Open Browser    ${CALL_BACK URL}      ${BROWSER}
    Maximize Browser Window
    A Card should be displayed

Open Browser to Fourm Page
    Open Browser    ${FOURM_PAGE URL}      ${BROWSER}
    Maximize Browser Window
    A Form should be displayed

A Card should be displayed
    Title Should Be    Card Page

A form should be displayed
    Title Should Be    Form Page

Red appeared add to List
   Append To List   ${list_to_populate}  ${Red}


Blue appeared add to List
   Append To List   ${list_to_populate}  ${Blue}


Refresh Page and Verify How many times each Color Card Appears
    TRY
    # Loop for 100 iterations
     # Verify if its Red or Blue
        WHILE    True    limit=100
         ${status} =    Run keyword and return status
        ...    Page Should Contain  Red Card
        Run keyword if  ${status}   Red appeared add to List

        ${status} =    Run keyword and return status
                ...   Page Should Contain    Blue Card
                Run keyword if  ${status}   Blue appeared add to List
            LOG TO CONSOLE   ${list_to_populate}
            Reload Page

        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.
    END
    # Get the toal amoun each on aperad out of 100 iertaion and turn into percentage
    ${numberOfRedCards}=  Count Values In List   ${list_to_populate}   ${Red}
    ${numberOfBlueCards} =   Count Values In List   ${list_to_populate}   ${Blue}
        LOG TO CONSOLE  --------Red Crads appeared ${numberOfRedCards} ---------
        LOG TO CONSOLE  ---------Blue Cards appeared ${numberOfBlueCards} --------
    # Asset that LowQuotes show up more often than MortgageLine
     Should Not Be Equal As Numbers   ${numberOfRedCards}  ${numberOfBlueCards}
     Should Be True   ${numberOfBlueCards} > ${numberOfRedCards}

Pause
  Set Selenium Speed    ${DELAY}

Enter First Name
    [Arguments]    ${FirstName}
    Input Text    name=firstName    ${FirstName}
    [Return]    ${FirstName}
Enter Last Name
    [Arguments]    ${LastName}
    Input Text    name=lastName    ${LastName}
    [Return]    ${LastName}

 Enter Age
    [Arguments]    ${Age}
    Input Text    name=age    ${Age}
    [Return]    ${Age}

Select Hobby
    [Arguments]    ${Hobby}
    Select From List By Label    name=hobby    ${Hobby}
    [Return]    ${Hobby}

Select Submit Button
    Click Button    css=button[type="submit"]

Verify Suceccful message is displayed
    Page Should Contain    Successfully Submitted!
















