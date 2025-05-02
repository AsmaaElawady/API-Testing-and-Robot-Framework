*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections

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
${EMAIL}          marwamostafa322@gmail.com
${PASSWORD}       1234abcd
${MIN_PRICE}      580
${MAX_PRICE}      1249

*** Keywords ***
Extract And Clean Price
    [Arguments]    ${price_text}
    ${price_text}=    String.Replace String    ${price_text}    EGP    ""
    ${price_text}=    String.Replace String    ${price_text}    ,    ""
    ${cleaned_price}=    Convert To Number    ${price_text}
    [Return]    ${cleaned_price}

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

Scenario 5
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Close popup if exists
    Run Keyword And Ignore Error    Click Element    css:div.Sk1_X._1-SOk
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    css:div.Sk1_X._1-SOk    10s
    # Hover over account icon to reveal the dropdown
    Wait Until Element Is Visible    css:.my-account--menuItem--1GDZChA    20s
    Mouse Over    css:.my-account--menuItem--1GDZChA
    # Click "Sign In" button
    Wait Until Element Is Visible    css:button.my-account--signin--RiPQVPB    15s
    Click Element    css:button.my-account--signin--RiPQVPB
    # Enter email
    Wait Until Element Is Visible    css:input[label="البريد الإلكتروني"]    10s
    Input Text    css:input[label="البريد الإلكتروني"]    ${EMAIL}
    Log    Email entered: ${EMAIL}
    Sleep    20s
    # After entering the email:
    Wait Until Element Is Visible    xpath=//div[@class="_2F0EX"]    10s
    Click Element    xpath=//div[@class="_2F0EX"]
    # Click the "مواصلة" (Continue) button
    Sleep    1s
    Wait Until Element Is Enabled    xpath=//button[span[text()="مواصلة"]]    10s
    Click Button    xpath=//button[span[text()="مواصلة"]]
    # Wait for password input field to appear
    Wait Until Element Is Visible    css:input[name="fm-login-password"]    10s
    Input Password    css:input[name="fm-login-password"]    ${PASSWORD}
    Log    Password entered.
    # Click submit button
    Wait Until Element Is Enabled    xpath=//button[span[text()="تسجيل الدخول"]]    10s
    Click Button    xpath=//button[span[text()="تسجيل الدخول"]]
    Log    logged in successfully
        # Existing steps up to login...
    Sleep    10s
    # Wait for slide-to-unlock to appear (optional)
    Wait Until Element Is Visible    id=nc_1__scale_text    30s
    Log    Slide-to-unlock appeared
    Wait Until Element Is Not Visible    id=nc_1__scale_text    30s
    Log    Slide-to-unlock disappeared
    # Hover over the logged-in account icon
    Wait Until Element Is Visible    css:.my-account--menuItem--1GDZChA.my-account--newMenuItem--bSu9Hkj    15s
    Mouse Over    css:.my-account--menuItem--1GDZChA.my-account--newMenuItem--bSu9Hkj
    Sleep    3s
    # Check if the welcome message appears
    Wait Until Element Is Visible    xpath=//span[contains(text(),"مرحبا بعودتك,")]    10s
    Element Should Be Visible    xpath=//span[contains(text(),"مرحبا بعودتك,")]
    Log    Welcome message verified.
    Sleep    5s
    Capture Page Screenshot
    Close Browser

Scenario 2
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    css=input.search--keyword--15P08Ji    10s
    Input Text    css=input.search--keyword--15P08Ji    ${SEARCH_QUERY}    5s
    Run Keyword And Ignore Error    Click Element    css=div[class="Sk1_X _1-SOk"]
    Wait Until Element Is Not Visible    css=div[class="Sk1_X _1-SOk"]    10s
    Run Keyword And Ignore Error    Click Element    css=input[class*="search--submit--2VTbd-T"]
    Wait Until Element Is Visible    css=input[class*="search--submit--2VTbd-T"]    10s
    Click Element    css=input[class*="search--submit--2VTbd-T"]
    Wait Until Page Contains    ${SEARCH_QUERY}    10s
    Page Should Contain    ${SEARCH_QUERY}
    # Apply Price Range Filter
    Wait Until Element Is Visible    css=div.i0_t    10s
    Input Text    css=input[name="minPrice"]    ${MIN_PRICE}    # Set the minimum price
    Input Text    css=input[name="maxPrice"]    ${MAX_PRICE}    # Set the maximum price
    Click Element    css=span.hv_hy    # Click on the "OK" button
    # Wait for prices to be visible on the page after filtering
    Wait Until Element Contains    css=span.hv_hx    EGP    10s
    Sleep    20s
    # Extract all the <span> elements with the price information
    ${price_elements}=    Get WebElements    xpath=//span[contains(text(), 'EGP')]
    Should Not Be Empty    ${price_elements}
    # Initialize empty list for cleaned prices
    ${cleaned_prices}=    Create List
    # Iterate through each price element, clean it, and add it to the list
    FOR    ${el}    IN    @{price_elements}
        ${price_text}=    Get Text    ${el}
        ${price_text}=    Strip String    ${price_text}
        Log    ${price_text}
        # Remove "EGP" and trim spaces
        ${cleaned_price}=    Replace String    ${price_text}    EGP    ${EMPTY}
        ${cleaned_price}=    Strip String    ${cleaned_price}
        # Remove commas for numeric conversion
        ${cleaned_price}=    Replace String    ${cleaned_price}    ,    ${EMPTY}
        # Skip if empty
        Run Keyword If    "${cleaned_price}" == "${EMPTY}"    Continue For Loop
        # Convert to number (now it's just digits, e.g., "438.48")
        ${price_number}=    Convert To Number    ${cleaned_price}
        log    ${price_number}
        # Validate price range
        Run Keyword If    ${price_number} < ${MIN_PRICE}    Fail    Price ${price_number} is below minimum (${MIN_PRICE})
        Run Keyword If    ${price_number} > ${MAX_PRICE}    Fail    Price ${price_number} is above maximum (${MAX_PRICE})
        # Optional: Store for logging
        Append To List    ${cleaned_prices}    ${price_number}
    END
    Log    ${cleaned_prices}    # Log the cleaned prices for debugging
    # Evaluate each cleaned price
    FOR    ${price}    IN    @{cleaned_prices}
        ${cleaned_price}=    Convert To Number    ${price}
        Log    ${cleaned_price}    # Log each cleaned price for evaluation
        Run Keyword If    ${cleaned_price} < ${MIN_PRICE}    Fail    Price ${cleaned_price} is below the minimum filter
        Run Keyword If    ${cleaned_price} > ${MAX_PRICE}    Fail    Price ${cleaned_price} is above the maximum filter
    END
    Close Browser
