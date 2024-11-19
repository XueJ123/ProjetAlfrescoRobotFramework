*** Settings ***
Documentation    CopierUneSelectionDeDossiersVers
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../Locators/locatorsLoginDashbordPage.py
Variables    ../Locators/locatorsAdminPage.py
Variables    ../Locators/locatorsFichiersPartagesPage.py
Resource    ../Resources/resourceAlfresco1.robot

*** Variables ***
${Username}    1689374
${Password}    12345678
${TIMEOUT}    120s
${vNomDossier}    DossierXue
${vNomSite}    SiteXue
${vUrlSite}    Url
${vDescriptionSite}    Description
${vVisbilitySite}    PUBLIC

*** Test Cases ***
RQ2.BF3.7: Copier une selection de dossiers vers
    Set Selenium Timeout    ${TIMEOUT}
    ${date_current} =    Init Date
    ##Pre-condition: Creer un dossier
    Log    Pre-condition
    Log in Alfresco    ${Username}    ${Password}
    Create Un Site Complet    ${vNomSite}${date_current}    ${vUrlSite}${date_current}    ${vDescriptionSite}${date_current}    ${vVisbilitySite}
    Creer un dossier    ${vNomDossier}${date_current}
    Sleep    8s
    Log Out Alfresco
    Close Browser

    ##Test Case
    Log    Test Case
    Log in Alfresco    ${Username}    ${Password}
    #wait until la page contient le champ de recherche
    Wait Until Page Contains Element    ${link_HeaderSearchbox}
    #saisir le nom de dossier dans le champ de recherche
    Input Text    ${link_HeaderSearchbox}    ${vNomDossier}${date_current}
    #presser return sur le clavier
    Press Keys    ${link_HeaderSearchbox}    RETURN
    #wait until le nom de dossier cible est visible
    Wait Until Element Is Visible    ${link_DossierCiblePart1}${vNomDossier}${date_current}${link_DossierCiblePart2}
    #survoler souris sur le nom de dossier cible
    Mouse Over    ${link_DossierCiblePart1}${vNomDossier}${date_current}${link_DossierCiblePart2}
    #wait until le bouton Actions est visible
    Wait Until Element Is Visible    ${btn_ActionDossierPart1}${vNomDossier}${date_current}${btn_ActionDossierPart2}
    #cliquer sur le bouton Actions
    Click Element    ${btn_ActionDossierPart1}${vNomDossier}${date_current}${btn_ActionDossierPart2}
    #wait until le lien Copier vers est visible
    Wait Until Element Is Visible    ${link_CopierVers}
    #cliquer sur le lien Copier vers
    Click Element    ${link_CopierVers}
    #wait until le lien Tous les sites est visible
    Wait Until Element Is Visible    ${link_ToutLesSites}
    #cliquer sur le lien Tous les sites dans le colonne Destination
    Click Element    ${link_ToutLesSites}
    #wait until le site cible est visible
    Wait Until Element Is Visible    ${link_SiteCibleCopierVersPart1}${vNomSite}${date_current}${link_SiteCibleCopierVersPart2}
    Scroll Element Into View    ${link_SiteCibleCopierVersPart1}${vNomSite}${date_current}${link_SiteCibleCopierVersPart2}
    #cliquer sur le site cible
    Click Element    ${link_SiteCibleCopierVersPart1}${vNomSite}${date_current}${link_SiteCibleCopierVersPart2}
    #wait until Document Library est visible
    Wait Until Element Is Visible    ${link_DocumentLibrary}
    #cliquer sur Document Library
    Click Element    ${link_DocumentLibrary}
    #wait until le bouton Copier est visible
    Wait Until Element Is Visible    ${btn_CopierDossierVers}
    #cliquer sur le bouton Copier
    Click Element    ${btn_CopierDossierVers}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Criteres de succes: Verifier le dossier est dans la location cible
    Log    Criteres de succes
    Log in Alfresco    ${Username}    ${Password}
    #cliquer sur le lien Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Recherche de sites est visible
    Wait Until Element Is Visible    ${link_RechercheSites}
    #cliquer sur le lien Recherche de sites
    Click Link    ${link_RechercheSites}
    #wait until la page contient le champ de recherche des sites
    Wait Until Page Contains Element    ${txt_RechercheSite}
    #saisir le champ de recherche des sites
    Input Text    ${txt_RechercheSite}    ${vNomSite}${date_current}
    #presser sur Return sur le clavier
    Press Keys    ${txt_RechercheSite}    RETURN
    Sleep    2s
    #cliquer sur le lien de site cilbe
    Click Element    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #wait until la page de site cible affiche
    Wait Until Page Contains Element    ${txt_TitleSitePart1}${vNomSite}${date_current}${txt_TitleSitePart2}
    #cliquer sur le lien Espace Documentaire
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    ${link_DocumentLibrarySite}
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_PlusPageSite}
    #wait until le lien Espace Documentaire est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    ${link_DocumentLibrarySite}
    #cliquer sur le lien Espace Documentaire
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_DocumentLibrarySite}
    Sleep    2s
    #verifier si la page contient le dossier cible
    Page Should Contain Element    ${txt_NomDossierCiblePart1}${vNomDossier}${date_current}${txt_NomDossierCiblePart2}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Post-conditions: Supprimer le dossier original, Supprimer le dossier copie, Vider corbeille
    Log    Post-conditions
    Log in Alfresco    ${Username}    ${Password}
    Supprimer un dossier    ${vNomDossier}${date_current}
    Sleep    2s
    Supprimer un site    ${vNomSite}${date_current}
    Sleep    2s
    Vider corbeille
    Sleep    2s
    Log Out Alfresco
    Close Browser
