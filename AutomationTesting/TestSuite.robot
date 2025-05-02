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
${PRODUCT_PAGE}    https://ar.aliexpress.com/item/1005008894456345.html?spm=a2g0o.productlist.main.1.45bdxFNKxFNKfm&algo_pvid=e48f5c8a-28d6-4800-991d-c9c1bc112e3a&algo_exp_id=e48f5c8a-28d6-4800-991d-c9c1bc112e3a-0&pdp_ext_f=%7B%22order%22%3A%22-1%22%2C%22eval%22%3A%221%22%7D&pdp_npi=4%40dis%21EGP%212609.75%21991.60%21%21%2146.90%2117.82%21%40210156fc17461168307326859e7df9%2112000047105661974%21sea%21EG%210%21ABX&curPageLogUid=0OABUwOn1rGM&utparam-url=scene%3Asearch%7Cquery_from%3A
${SEARCH_CARD_ITEM}    css=a.search-card-item
${ADD_TO_CART_BTN}    css=button.add-to-cart--addtocart--Qhoji3M
${SELECTED_ITEM}    css=img.sku-item--selected--ITGY_EO
${CART_ICON}      xpath=//a[contains(@href, 'shoppingcart/index.html')]
${SELECTED_DIV}    css=div[class*="sku-item--selected"]
${IMAGE}          xpath=.//img
${CAPTCHA}        xpath=//iframe[contains(@src, 'recaptcha')]
${PRODUCT_TITLE}    xpath=//div[contains(@class, 'title--wrap--UUHae_g')]//h1

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
    sleep    7
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

Scenario 7
    Open Browser    ${PRODUCT_PAGE}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css:.magnifier--image--RM17RL2    30s
    Mouse Over    css:.magnifier--behiver--cY4D2TR
    Sleep    2s
    Click Element    css:.magnifier--behiver--cY4D2TR
    ${style}=    Get Element Attribute    css:.magnifier--image--RM17RL2    style
    Should Contain    ${style}    transform
    Capture Page Screenshot
    Close Browser

Scenario 3
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Run Keyword And Ignore Error    Click Element    ${CLOSE_POPUP_BUTTON}
    Run Keyword And Ignore Error    Click Element    ${ACCEPT_COOKIES_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_INPUT}    ${WAIT_TIMEOUT}
    Input Text    ${SEARCH_INPUT}    ${SEARCH_QUERY}
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    ${WAIT_TIMEOUT}
    Click Element    ${SUBMIT_BUTTON}
    Wait Until Page Contains    ${SEARCH_QUERY}    ${WAIT_TIMEOUT}
    Page Should Contain    ${SEARCH_QUERY}
    Wait Until Page Contains Element    ${SEARCH_CARD_ITEM}    ${WAIT_TIMEOUT}
    ${search_card_items}=    Get WebElements    ${SEARCH_CARD_ITEM}
    Click Element    ${search_card_items}[0]
    ${window_handles}=    Get Window Handles
    ${new_window}=    Set Variable    ${window_handles}[1]
    Switch Window    ${new_window}
    ${new_url}=    Get Location
    Run Keyword And Ignore Error    Wait Until Page Does Not Contain Element    ${CAPTCHA}    30s
    Wait Until Page Contains Element    ${ADD_TO_CART_BTN}    ${WAIT_TIMEOUT}
    Click Element    ${ADD_TO_CART_BTN}
    ${title_item}    Get WebElement    ${PRODUCT_TITLE}
    ${title_text}    Get Text    ${title_item}
    Log To Console    Selected item title: ${title_text}
    Sleep    3
    Click Element    ${CART_ICON}
    Sleep    3
    Page Should Contain Element    xpath=//a[contains(text(), "${title_text}")]
    [Teardown]    Close Browser
