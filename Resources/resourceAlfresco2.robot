*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime
Library    CSVmodule
Variables    ../Locators/locatorsLoginDashbordPage.py
Variables    ../Locators/locatorsAdminPage.py
Variables    ../Locators/locatorsSitePage.py

*** Variables ***
${TIMEOUT}    120s
${vURL}    http://localhost:8088/share/page/
${vBrowser}    gc

*** Keywords ***

Ajouter Proprietes A Un Type Personnalise
    [Arguments]    ${vNomPropriete}    ${vTitlePropriete}    ${vDescriptionPropriete}    ${vTypeDonneesPropriete}    ${vMultiplePropriete}    ${vValeurDefautPropriete}
    Set Selenium Timeout    ${TIMEOUT}
    #wait until le bouton Creer une propriete est visible
    Wait Until Element Is Visible    ${btn_CreerUnePropriete}
    #cliquer sur le bouton Creer une propriete
    Click Element    ${btn_CreerUnePropriete}
    Sleep    2S      
    #saisir les donnees de propriete
    Input Text    ${txt_NomPropriete}    ${vNomPropriete}${date_current}
    Input Text    ${txt_TitlePropriete}    ${vTitlePropriete}
    Input Text    ${txt_DescriptionPropriete}    ${vDescriptionPropriete}
    #cliquer sur le menu roulant de Type de donnees
    Click Element    ${menu_TypeDonneesPropriete}
    #wait until option de Type est visible
    Wait Until Element Is Visible    ${txt_TypeDonneesProprietePart1}${vTypeDonneesPropriete}${txt_TypeDonneesProprietePart2}
    #selectionner un type de donnees
    Click Element    ${txt_TypeDonneesProprietePart1}${vTypeDonneesPropriete}${txt_TypeDonneesProprietePart2}
    #cliquer sur le menu roulant de Requise (Remplacer 'Optional' par 'Facultative' pour edition Francais)
    Click Element    ${menu_RequisPropriete}
    #wait until option de Requise est visible
    Wait Until Element Is Visible    ${link_RequisProprietePart1}${vRequisePropriete}${link_RequisProprietePart2}
    #selectionner un Requise
    Click Element    ${link_RequisProprietePart1}${vRequisePropriete}${link_RequisProprietePart2}
    #selectionner Checkbox de Multiple
    Run Keyword If    '${vMultiplePropriete}' == 'OUI'    Select Checkbox    ${checkbox_MultiplePropriete}
    
    #saisir donnes de Valeur par defaut
    Input Text    ${txt_ValueDefautPropriete}    ${vValeurDefautPropriete}
    #cliquer sur le menu roulant de Contrainte (Remplacer 'None' par 'Aucun' pour edition Francais)
    Click Element    ${menu_ContraintePropriete}
    #wait until option de contraite est visible
    Wait Until Element Is Visible    ${txt_ContrainteProprietePart1}${vContraintePropriete}${txt_ContrainteProprietePart2}
    #selectionner un contrainte
    Click Element    ${txt_ContrainteProprietePart1}${vContraintePropriete}${txt_ContrainteProprietePart2}
    #cliquer sur le menu roulant de Indexation (Remplacer 'Basic' par 'Texte libre' pour edition Francais)
    Click Element    ${menu_IndexationPropriete}
    #wait until option de Indexation est visible
    Wait Until Element Is Visible    ${txt_IndexationProprietePart1}${vIndexationPropriete}${txt_IndexationProprietePart2}
    #selectionner un Indexation
    Click Element    ${txt_IndexationProprietePart1}${vIndexationPropriete}${txt_IndexationProprietePart2}
    #cliquer sur le boutton creer
    Click Element    ${btn_CreerCreerUnePropriete}
    Sleep    3s