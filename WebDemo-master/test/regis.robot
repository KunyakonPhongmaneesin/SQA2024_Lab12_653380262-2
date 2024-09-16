*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${REGISTRATION PAGE}    http://localhost:7272/Lab12/Registration.html
${SUCCESS PAGE}         http://localhost:7272/Lab12/Success.html
${BROWSER}              chrome
${FIRST NAME}           Somsri
${LAST NAME}            Sodsai
${ORGANIZATION}         CS KKU
${EMAIL}                somsri@kkumail.com
${PHONE}                081-001-1234

*** Test Cases ***
Open Event Registration Page
    Open Browser    ${REGISTRATION PAGE}    ${BROWSER}
    Title Should Be    Event Registration
    Close Browser

Register Success
    Open Browser    ${REGISTRATION PAGE}    ${BROWSER}
    Input Text    id=first-name    ${FIRST NAME}
    Input Text    id=last-name    ${LAST NAME}
    Input Text    id=organization    ${ORGANIZATION}
    Input Text    id=email    ${EMAIL}
    Input Text    id=phone    ${PHONE}
    Click Button    id=registerButton
    Wait Until Page Contains    Success
    Location Should Be    ${SUCCESS PAGE}
    Title Should Be    Success
    Page Should Contain    Success
    Page Should Contain    Thank you for participating in our event
    Close Browser

