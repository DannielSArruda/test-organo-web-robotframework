*** Settings ***
Resource    ../main.robot

*** Keywords ***
I access Organo
    ${valuesetname}=    Acquire Value Set
    ${BROWSER}=        Get Value From Set    browser
    Open Browser    url=http://localhost:3000/     browser=${BROWSER}

Close the browser
    Capture Page Screenshot
    Close Browser