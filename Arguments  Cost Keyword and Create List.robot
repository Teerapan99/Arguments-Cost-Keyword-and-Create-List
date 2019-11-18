*** Settings ***

Library           openpyxl
Library           BuiltIn
Library           String
Library           Collections


*** Variables ***

${data_Excel}           Test Data.xlsx

*** Keywords ***
Get Data form excel
    ${wbGet}      Load Workbook           ${data_Excel}
    ${wsGet}      Set Variable     ${wbGet.get_sheet_by_name('Config')}
    ${Colum_1}    Set Variable     ${wsGet.cell(2,1).value}
    ${Colum_2}    Set Variable     ${wsGet.cell(1,2).value}
    @{List}=    Create List
    Append To List    ${List}     ${Colum_1}    ${Colum_2}
    Set Test    ${List}

Set Test
    [Arguments]     ${List}
    :FOR    ${Test}    IN    @{List}
    \       Log To Console    \n ${Test}
    # Log To Console     outside loop

*** Test Cases ***
Open
     [Documentation]    Test Assign Value in Arguments and Create List
     Get Data form excel


    # Calculator2
    # Cal 2+2
