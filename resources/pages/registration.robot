*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${FIELD_NAME}             id:form-nome
${FIELD_ROLE}             id:form-cargo
${FIELD_IMAGE}            id:form-imagem
${FIELD_TEAM}             class:lista-suspensa
${BUTTON_CARD}            id:form-botao
@{select_teams}
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')] 
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação e Gestão')]

*** Keywords ***
I fill out the form fields
    ${Name}           FakerLibrary.First Name
    Input Text        ${FIELD_NAME}      ${Name}
    ${Role}           FakerLibrary.Job
    Input Text        ${FIELD_ROLE}      ${Role}
    ${Image}          FakerLibrary.Image Url    width=100    height=100
    Input Text        ${FIELD_IMAGE}     ${Image}
    Click Element     ${FIELD_TEAM}
    Click Element     ${select_teams}[0]

I click the "Create Card" button
    Click Element    ${BUTTON_CARD}

Click the "Create Card" button
    Click Element     ${BUTTON_CARD}

I should identify the card in the expected team
    Element Should Be Visible    class:colaborador

I should identify 3 cards in the expected team
    FOR    ${i}    IN RANGE    1    3
        Given I fill out the form fields
        And click the "Create Card" button
    END
    Sleep    1s

1 card should be created in each available team
    FOR    ${index}    ${team}    IN ENUMERATE    @{select_teams}
        Given I fill out the form fields
        Click Element     ${team}
        And click the "Create Card" button
    END
    Sleep    1s

The system should display a required field message
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
