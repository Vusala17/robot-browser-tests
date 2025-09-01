*** Settings ***
Library    Browser
Resource    ../resource/constants/invalid_login_constants.resource
Resource    ../resource/locators/valid_login.resource

*** Keywords ***
New Browser And Go To Login Page
    New Browser    chromium    headless=false
    New Context
    New Page    ${LOGIN_URL}


Log In With Valid Credentials
    Fill Text    ${LOCATOR_USERNAME}    ${VALID_USERNAME}
    Fill Text    ${LOCATOR_PASSWORD}    ${VALID_PASSWORD}
    Click        ${LOCATOR_LOGIN_BTN}  
    Wait For Elements State    ${LOCATOR_PRODUCTS_CONTAINER}    visible