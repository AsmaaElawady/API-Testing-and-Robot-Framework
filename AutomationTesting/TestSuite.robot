*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.aliexpress.com/
${BROWSER}        chrome
${CLOSE_POPUP_BUTTON}    css=button[class*="close"]
${ACCEPT_COOKIES_BUTTON}    css=button[class*="accept-btn"]
${SEARCH_INPUT}    css=input.search--keyword--15P08Ji
${SEARCH_QUERY}    smart watch
${SUBMIT_BUTTON}    css=input.search--submit--2VTbd-T
${WAIT_TIMEOUT}    10s
${POPUP_SELECTOR}    css:._3KrBP._3XMV3
${POPUP_CLOSE_BTN}    css:.Sk1_X._1-SOk
${CURRENCY_INDICATOR}    css:.ship-to--menuItem--WdBDsYl
${CURRENCY_DROPDOWN}    xpath=(//div[contains(@class, 'select--wrap--3N7DHe_')])[3]
${USD_OPTION}     xpath=//div[contains(@class,'select--item--32FADYB') and contains(., 'USD')]
${SAVE_BTN}       css:.es--saveBtn--w8EuBuy
${CONFIRMATION}    xpath=//*[contains(text(), 'US')]

*** Test Cases ***
Scenario 1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Run Keyword And Ignore Error    Click Element    ${CLOSE_POPUP_BUTTON}
    Run Keyword And Ignore Error    Click Element    ${ACCEPT_COOKIES_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_INPUT}    ${WAIT_TIMEOUT}
    Input Text    ${SEARCH_INPUT}    ${SEARCH_QUERY}
    sleep    7
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    ${WAIT_TIMEOUT}
    Click Element    ${SUBMIT_BUTTON}
    Wait Until Page Contains    ${SEARCH_QUERY}    ${WAIT_TIMEOUT}
    Page Should Contain    ${SEARCH_QUERY}
    Close Browser

Scenario 6
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    15s
    ${popup_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${POPUP_SELECTOR}
    Run Keyword If    ${popup_visible}    Click Element    ${POPUP_CLOSE_BTN}
    Sleep    2s
    Wait Until Page Contains Element    ${CURRENCY_INDICATOR}    timeout=20s
    Element Should Contain    ${CURRENCY_INDICATOR}    EGP
    Scroll Element Into View    ${CURRENCY_INDICATOR}
    Click Element    ${CURRENCY_INDICATOR}
    Click Element    ${CURRENCY_DROPDOWN}
    sleep    1s
    Click Element    ${USD_OPTION}
    sleep    1s
    Wait Until Element Is Visible    ${SAVE_BTN}    ${WAIT_TIMEOUT}
    Click Element    ${SAVE_BTN}
    Wait Until Page Contains Element    ${CONFIRMATION}    ${WAIT_TIMEOUT}
    Reload Page
    sleep    7s
    Close Browser
