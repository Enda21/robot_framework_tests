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
${CALL_BACK URL}  https://www.daft.ie/daft-mortgages/buying-budget/call-back
@{list_to_populate}    #   create empty list to populate with for-loop
${LowQuotes}=     LowQuotes
${MortgageLine}=    MortgageLine


*** Keywords ***
Open Browser to Card Page
    Open Browser    ${CALL_BACK URL}      ${BROWSER}
    Maximize Browser Window
    A Card should be displayed
    Click Button  xpath: //*[contains(text(), "Accept All")]

A Card should be displayed
    Title Should Be    Daft Mortgages: Request Callback

LowQuotes appeared add to List
   Append To List   ${list_to_populate}  ${LowQuotes}


MortgageLine appeared add to List
   Append To List   ${list_to_populate}  ${MortgageLine}


Refresh Page and Verify How many times each Color Card Appears
    TRY
    # Loop for 100 iterations
     # Verify if its LowQuotes or MortgageLine
        WHILE    True    limit=100
         ${status}=    Run keyword and return status
        ...    Page should contain element    id=input-wrapper-lowQuotes
        Run keyword if  ${status}   LowQuotes appeared add to List

        ${status}=    Run keyword and return status
                ...    Page should contain element   id=input-wrapper-mortgageLine
                Run keyword if  ${status}   MortgageLine appeared add to List
            LOG TO CONSOLE   ${list_to_populate}
            Reload Page

        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.
    END
    # Get the toal amoun each on aperad out of 100 iertaion and turn into percentage
    ${numberOfMortgageLine}=  Count Values In List   ${list_to_populate}   ${MortgageLine}
    ${numberOfLowQuotes} =   Count Values In List   ${list_to_populate}   ${LowQuotes}
        LOG TO CONSOLE  --------Low Quotes appeared ${numberOfLowQuotes} ---------
        LOG TO CONSOLE  ---------Mortage Line appeared ${numberOfMortgageLine} --------
    # Asset that LowQuotes show up more often than MortgageLine
     Should Not Be Equal As Numbers   ${numberOfMortgageLine}  ${numberOfLowQuotes}
     Should Be True   ${numberOfLowQuotes} > ${numberOfMortgageLine}

Pause
  Set Selenium Speed    ${DELAY}













