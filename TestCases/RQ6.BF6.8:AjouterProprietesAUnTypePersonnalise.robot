*** Settings ***
Documentation    TestAjouterProprietesAUnTypePersonnalise
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../Locators/locatorsLoginDashbordPage.py
Variables    ../Locators/locatorsAdminPage.py
Variables    ../Locators/locatorsSitePage.py
Resource    ../Resources/resourceAlfresco1.robot

*** Variables ***
${Username}    1689374
${Password}    12345678
${TIMEOUT}    120s
${vNomModele}    ModeleXue
${vNomType}    TypeXue
${vNomPropriete}    ProprieteXue
${vTitlePropriete}    TitlePropriete
${vDescriptionPropriete}    DescriptionPropriete
${vTypeDonneesPropriete}    d:int
${vRequisePropriete}    Mandatory
${vMultiplePropriete}    OUI
${vValeurDefautPropriete}    0
${vContraintePropriete}    None
${vIndexationPropriete}    None


*** Test Cases ***
RQ6.BF6.8 AjouterProprietesAUnTypePersonnalise
    Set Selenium Timeout    ${TIMEOUT}
    ${date_current} =    Init Date
    ##Pre-condition: Creer un type personnalise
    Log    Pre-condition
    Log in Alfresco    ${Username}    ${Password}
    Creer un type personnalise    ${vNomModele}    ${vNomType}${date_current}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Test Case
    Log    Test Case
    Log in Alfresco    ${Username}    ${Password}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    ${link_GestionnaireDeModeles}
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    ${link_GestionnaireDeModeles}
    #wait until la page contains le lien de modele cible
    Wait Until Page Contains Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    #cliquer sur le nom de modele cible
    Click Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    Sleep    2s
    #wait until le lien de Type cible est visible
    Wait Until Element Is Visible    ${link_TypeCiblePart1}${vNomType}${date_current}${link_TypeCiblePart2}
    #cliquer sur le lien de Type cible
    Click Element    ${link_TypeCiblePart1}${vNomType}${date_current}${link_TypeCiblePart2}
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
    Sleep    2s
    Log Out Alfresco
    Close Browser
    
    ##Criteres de succes: verifier la propriete cree affiche sur la page
    Log    Criteres de succes
    Log in Alfresco    ${Username}    ${Password}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    ${link_GestionnaireDeModeles}
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    ${link_GestionnaireDeModeles}
    #wait until la page contains le lien de modele cible
    Wait Until Page Contains Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    #cliquer sur le nom de modele cible
    Click Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    Sleep    2s
    #wait until le lien de Type cible est visible
    Wait Until Element Is Visible    ${link_TypeCiblePart1}${vNomType}${date_current}${link_TypeCiblePart2}
    #cliquer sur le lien de Type cible
    Click Element    ${link_TypeCiblePart1}${vNomType}${date_current}${link_TypeCiblePart2}
    #wait until le propriete cible est visible
    Wait Until Element Is Visible    ${link_ProprieteCilbePart1}${vNomModele}:${vNomPropriete}${date_current}${link_ProprieteCilbePart2}
    #cliquer sur le lien du propriete cible
    Click Element    ${link_ProprieteCilbePart1}${vNomModele}:${vNomPropriete}${date_current}${link_ProprieteCilbePart2}
    Sleep    2s
    Textfield Value Should Be    ${txt_TitlePropriete}    ${vTitlePropriete}
    Textarea Value Should Be    ${txt_DescriptionPropriete}    ${vDescriptionPropriete}
    Page Should Contain Element    ${txt_TypeDonneesProprieteSelectedPart1}${vTypeDonneesPropriete}${txt_TypeDonneesProprieteSelectedPart2}
    Page Should Contain Element    ${txt_RequiseProprieteSelectedPart1}${vRequisePropriete}${txt_RequiseProprieteSelectedPart2}
    Run Keyword If    '${vMultiplePropriete}' == 'OUI'    Checkbox Should Be Selected    ${checkbox_MultiplePropriete}
    Run Keyword If    '${vMultiplePropriete}' == 'NON'    Checkbox Should Not Be Selected    ${checkbox_MultiplePropriete}
    Textfield Value Should Be    ${txt_ValueDefautPropriete}    ${vValeurDefautPropriete}
    Page Should Contain Element    ${txt_ContrainteProprieteSelectedPart1}${vContraintePropriete}${txt_ContrainteProprieteSelectedPart2}
    Page Should Contain Element    ${txt_IndexationProprieteSelectedPart1}${vIndexationPropriete}${txt_IndexationProprieteSelectedPart2}
    #cliquer sur le bouton Annuler
    Click Element    ${btn_AnnulerCreerUnePropriete}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Post-conditions: Supprimer le propriete, Supprimer le type, Vider corbeille
    Log    Post-conditions
    Log in Alfresco    ${Username}    ${Password}
    Supprimer une propriete dans un type personnalise    ${vNomModele}    ${vNomType}${date_current}    ${vNomPropriete}${date_current}
    Supprimer un type personnalise    ${vNomModele}    ${vNomType}${date_current}
    Vider corbeille
    Sleep    2s
    Log Out Alfresco
    Close Browser