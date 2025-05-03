*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.aliexpress.com/?lan=en
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
${LANG_MENU}      css:div.ship-to--menuItem--WdBDsYl
${LANG}           //*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[1]/div
${EN_LANG}        //*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[2]/div[2]
${PRODUCTNAME}    xpath=//h3
${PRICEWITHUS}    xpath=//span[contains(text(), '$')]
${SHIP_COUNTRY_DROPDOWN}    xpath=(//div[contains(@class, 'select--wrap--3N7DHe_')])[1]
${UNITED_STATES}    xpath=(//div[contains(@class, 'select--item--32FADYB')])[1]
${CURRENCY_LABEL}    xpath=//div[contains(@class, 'ship-to--text--3H_PaoC')]//b
${RANDOM_PRODUCT}    xpath=//div[contains(@class, '_2FypS')][1]//div
${DELIVERY_OPTIONS}    css=span.delivery-v2--to--Mtweg7y
${PRODUCT_PRICE}    css=span.product-price-value
${CART_NUMBER}    css=span.shop-cart--number--axE62FE
${QUANTITY_INPUT}    css=input.comet-v2-input-number-input

*** Test Cases ***
Scenario 1
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    15s
    Wait Until Element Is Visible    ${SEARCH_INPUT}    20s
    Input Text    ${SEARCH_INPUT}    ${SEARCH_QUERY}
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    20s
    Click Element    ${SUBMIT_BUTTON}
    Page Should Contain    ${SEARCH_QUERY}
    Wait Until Page Contains Element    ${PRODUCTNAME}    40s
    ${product_title}=    Get WebElements    ${PRODUCTNAME}
    FOR    ${title}    IN    @{product_title}
        ${text}=    Get Text    ${title}
        Log    Checking: ${text}
        Should Match Regexp    ${text.lower()}    .*((smart\s?watch)|(smartwatch)|(ساعة\s?ذكية)|(الساعة\s?الذكية)|(ساعة)).*
    END
    Close Browser

Scenario 6
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    ${WAIT_TIMEOUT}
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
    Wait Until Element Is Visible    ${SAVE_BTN}    ${WAIT_TIMEOUT} \
    Click Element    ${SAVE_BTN}
    Wait Until Page Contains Element    ${CONFIRMATION}    timeout=5s
    sleep    7s
    Wait Until Element Is Visible    ${PRICEWITHUS}    timeout=10s
    ${price_elements}=    Get WebElements    ${PRICEWITHUS}
    Should Not Be Empty    ${price_elements}
    FOR    ${el}    IN    @{price_elements}
        ${price_text}=    Get Text    ${el}
        Run Keyword If    '${price_text.strip()}' != ''    Should Contain    ${price_text}    $
        Log    ${price_text}=
    END
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
    Wait Until Page Contains Element    ${CART_NUMBER}    ${WAIT_TIMEOUT}
    ${cart_txt}=    Get Element Attribute    ${CART_NUMBER}    innerText
    ${cart_num}=    Convert To Integer    ${cart_txt}
    Wait Until Page Contains Element    ${ADD_TO_CART_BTN}    ${WAIT_TIMEOUT}
    Click Element    ${ADD_TO_CART_BTN}
    ${quantity}=    Get Element Attribute    ${QUANTITY_INPUT}    value
    ${quantity_num}=    Convert To Integer    ${quantity}
    ${new_cart_num}=    Evaluate    ${cart_num} + ${quantity_num}
    ${curr_cart_txt}=    Get Element Attribute    ${CART_NUMBER}    innerText
    ${curr_cart_num}=    Convert To Integer    ${curr_cart_txt}
    #Should Be Equal As Numbers    ${curr_cart_num}    ${new_cart_num}
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

Senario 2
    Open Browser    ${URL}    ${BROWSER}
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
    Wait Until Element Is Visible    css=div.hv_hw    10s
    Input Text    css=input[name="minPrice"]    ${MIN_PRICE}    # Set the minimum price
    Input Text    css=input[name="maxPrice"]    ${MAX_PRICE}    # Set the maximum price
    Click Element    css=span.hv_hy    # Click on the "OK" button
    # Wait for prices to be visible on the page after filtering
    Wait Until Element Contains    css=span.hv_hx    EGP    10s
    Sleep    10s
    Wait Until Element Is Visible    css=div.i0_t    30s
    # Validate that the minPrice and maxPrice fields contain the expected values
    ${min_price_value}=    Get Value    css=input[name="minPrice"]
    ${max_price_value}=    Get Value    css=input[name="maxPrice"]
    # Assert the values of the min and max price fields
    Should Be Equal As Numbers    ${min_price_value}    ${MIN_PRICE}
    Should Be Equal As Numbers    ${max_price_value}    ${MAX_PRICE}
    Close Browser

Scenario4
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Scroll Element Into View    ${LANG_MENU}
    Wait Until Element Is Visible    ${LANG_MENU}    10s
    Click Element    ${LANG_MENU}
    Wait Until Element Is Visible    ${LANG}    10s
    Scroll Element Into View    ${LANG}
    Click Element    ${LANG}
    Sleep    2s
    #Switch Lang to English
    Wait Until Element Is Visible    ${EN_LANG}
    Click Element    ${EN_LANG}
    #Click the save button
    Click Element    xpath=//div[contains(text(), 'حفظ')]
    Sleep    7s
