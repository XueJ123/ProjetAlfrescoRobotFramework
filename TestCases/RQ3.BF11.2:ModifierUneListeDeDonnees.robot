*** Settings ***
Documentation    ModifierUneListeDeDonnees
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
${vTypeListe}    1
${vNomListeDonnees}    ListeDonneesXue
${vDesciptionListeDonnees}    DesciptionListeDonnees
${vNomListeDonneesModifier}    ListeDonneesXueModifier
${vDesciptionListeDonneesModifier}    DesciptionListeDonneesModifier
${vNomSite}    SiteXue
${vUrlSite}    Url
${vDescriptionSite}    Description
${vVisbilitySite}    PUBLIC

*** Test Cases ***
RQ3.BF11.2: ModifierUneListeDeDonnees
    Set Selenium Timeout    ${TIMEOUT}
    ${date_current} =    Init Date
    ##Pre-condition: Creer une liste de donnees
    Log    Pre-condition
    Log in Alfresco    ${Username}    ${Password}
    Create Un Site Complet    ${vNomSite}${date_current}    ${vUrlSite}${date_current}    ${vDescriptionSite}${date_current}    ${vVisbilitySite}
    Sleep    2s
    Creer une liste de donnees    ${vNomSite}${date_current}    ${vTypeListe}    ${vNomListeDonnees}${date_current}    ${vDesciptionListeDonnees}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Test Case
    Log    Test Case
    Log in Alfresco    ${Username}    ${Password}
    #cliquer sur onglet Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    ${link_HeaderMesSites}
    #cliquer sur le lien Mes sites
    Click Element    ${link_HeaderMesSites}
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #cliquer sur le lien du site cible
    Click Element    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #wait until la page de site cible affiche
    Wait Until Page Contains Element    ${txt_TitleSitePart1}${vNomSite}${date_current}${txt_TitleSitePart2}
    #cliquer sur le lien Listes de donnees
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    ${link_ListeDonneesSite}
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_PlusPageSite}
    #wait until le lien Listes de donnees est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    ${link_ListeDonneesSite}
    #cliquer sur le lien Listes de donnees
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_ListeDonneesSite}
    Sleep    2s
    #wait until le lien du liste cible est visible
    Wait Until Element Is Visible    ${link_ListeDonnessCiblePart1}${vNomListeDonnees}${date_current}${link_ListeDonnessCiblePart2}
    #survoler le souris sur le lien du liste cible
    Mouse Over    ${link_ListeDonnessCiblePart1}${vNomListeDonnees}${date_current}${link_ListeDonnessCiblePart2}
    #wait until icone edit est visible
    Wait Until Element Is Visible    ${btn_EditListeDonneesCiblePart1}${vNomListeDonnees}${date_current}${btn_EditListeDonneesCiblePart2}
    #cliquer sur icone edit
    Click Element    ${btn_EditListeDonneesCiblePart1}${vNomListeDonnees}${date_current}${btn_EditListeDonneesCiblePart2}
    #wait until le champ de titre est visible
    Wait Until Element Is Visible    ${txt_TitreListeDonnees}
    #saisir le champ de Titre
    Input Text    ${txt_TitreListeDonnees}    ${vNomListeDonneesModifier}
    #saisir le champ de description
    Input Text    ${txt_DescriptionListeDonnees}    ${vDesciptionListeDonneesModifier}
    #cliquer sur le boutton Enregistrer
    Click Button    ${btn_EnregistrerListeDonnees}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Criteres de succes: la page doit contenir le titre et description du liste
    Log    Criteres de succes
    Log in Alfresco    ${Username}    ${Password}
    #cliquer sur onglet Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    ${link_HeaderMesSites}
    #cliquer sur le lien Mes sites
    Click Element    ${link_HeaderMesSites}
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #cliquer sur le lien du site cible
    Click Element    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #wait until la page de site cible affiche
    Wait Until Page Contains Element    ${txt_TitleSitePart1}${vNomSite}${date_current}${txt_TitleSitePart2}
    #cliquer sur le lien Listes de donnees
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    ${link_ListeDonneesSite}
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_PlusPageSite}
    #wait until le lien Listes de donnees est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    ${link_ListeDonneesSite}
    #cliquer sur le lien Listes de donnees
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_ListeDonneesSite}
    Sleep    2s
    #wait until le lien du liste cible est visible
    Wait Until Element Is Visible    ${link_ListeDonnessCiblePart1}${vNomListeDonneesModifier}${link_ListeDonnessCiblePart2}
    #cliquer sur le lien du liste cible
    Click Element    ${link_ListeDonnessCiblePart1}${vNomListeDonneesModifier}${link_ListeDonnessCiblePart2}
    #verifier si le nom de liste est modifie
    Page Should Contain Element    ${txt_NomListeDonneesModifiePart1}${vNomListeDonneesModifier}${txt_NomListeDonneesModifiePart2}
    #verifier si la description de liste est modifie
    Page Should Contain Element    ${txt_DescriptionListeDonneesModifiePart1}${vDesciptionListeDonneesModifier}${txt_DescriptionListeDonneesModifiePart2}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Post-conditions: Supprimer la liste de donnees, Supprimer le site, Vider corbeille
    Log    Post-conditions
    Log in Alfresco    ${Username}    ${Password}
    Supprimer une liste de donnees    ${vNomSite}${date_current}    ${vNomListeDonneesModifier}
    Sleep    2s
    Supprimer un site    ${vNomSite}${date_current}
    Sleep    2s
    Vider corbeille
    Log Out Alfresco
    Close Browser
    