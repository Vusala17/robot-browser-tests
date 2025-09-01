*** Settings ***
Library    Browser
Resource    ../resource/constants/invalid_login_constants.resource
Resource    ../resource/locators/invalid_login.resource
Resource    ../resource/auth.resource
Resource    ../resource/constants/valid_login_constants.resource
Suite Setup    New Browser And Go To Login Page
Suite Teardown    Close Browser

*** Variables ***
${LOGIN_URL}       https://www.saucedemo.com/
${INVALID_USER}    wrong_user
${INVALID_PASS}    wrong_pass
${ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
Invalid User Should Not Be Able To Login
    [Documentation]    Ensure login fails with invalid credentials
    New Page    ${LOGIN_URL}
    Fill Text    ${LOCATOR_USERNAME}    ${INVALID_USER} 
    Fill Text    ${LOCATOR_PASSWORD}    ${VALID_PASSWORD}
    Click        ${LOCATOR_LOGIN_BTN}  
    Wait For Elements State    ${LOCATOR_ERROR_MSG}    visible
    Get Text    ${LOCATOR_ERROR_MSG}    ==    ${ERROR_MESSAGE}

Standard User Should Login Successfully
    [Documentation]    Ensure standard user can log in successfully
    New Page    ${LOGIN_URL}
    Log IN With Valid Credentials
    