*** Settings ***
Library    SeleniumLibrary
Library    String
Suite Setup    Setup1
Suite Teardown    Close browser

*** Variables ***
${browser}    Chrome
${accept_cookies}    //button[@class='btn btn-primary js-accept gtm_h76e8zjgoo btn-block']
${cookie_msg}    //div[@class='gdpr-cookie-banner js-gdpr-cookie-banner pad-sep-xs pad-hrz-none show']
${sort_by_dropdown}    //button[@class='btn btn-sm btn-alt sort-control-btn gtm_ejaugtrtnc']
${price_desc_dropdown_option}    //a[normalize-space()='Pret descrescator']
${add_to_basket_btn}    (//button[@type='submit'][normalize-space()='Adauga in Cos'])[index]
${preloader}    (//div[@class='preloader' and @style='display: block;'])[2]
${close_popup_btn}    //button[@class='close gtm_6046yfqs']

*** Test Cases ***
Test1
    [Documentation]  This is Test1
    [Tags]  Suite1

    Click On Element    ${accept_cookies}
    Wait Until Element Is Not Visible    ${cookie_msg}
    FOR    ${element}    IN    ${sort_by_dropdown}    ${price_desc_dropdown_option}
        Click On Element    ${element}
    END

    Wait Until Element Is Not Visible    ${preloader}

    FOR   ${index}    IN RANGE    1    3
        ${index}    Convert To String   ${index}
        ${element}    Replace String    ${add_to_basket_btn}    index    ${index}
        Click On Element    ${element}
        Click On Element    ${close_popup_btn}
    END

*** Keywords ***
Click On Element
    [Arguments]  ${element}
    Sleep    1s
    Wait Until Element Is Visible    ${element}
    Wait Until Element Is Enabled    ${element}
    Click Element   ${element}

Setup1
    Open browser    https://www.emag.ro/laptopuri/    ${browser}
    Maximize Browser Window
