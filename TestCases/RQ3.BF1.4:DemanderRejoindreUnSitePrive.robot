*** Settings ***
Documentation    DemanderRejoindreUnSitePrive
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../Locators/locatorsLoginDashbordPage.py
Variables    ../Locators/locatorsAdminPage.py
Resource    ../Resources/resourceAlfresco1.robot

*** Variables ***
${Username}    1689374
${Password}    12345678
${TIMEOUT}    120s
${vPrenomUser}    Prenom
${vEmailUser}    @abc.com
${vNomUser}    Nom
${vPasswordUser}    Password
${vNomSite}    SiteXue
${vUrlSite}    UrlXue
${vDescriptionSite}    DescriptionXue

*** Test Cases ***
RQ3.BF1.4: Demander a Rejoindre Un Site Prive
    Set Selenium Timeout    ${TIMEOUT}

    ##Pre-condition:Creer un compte utilisateur1
    Log    Pre-condition Creer un compte utilisateur1
    ${date_current1} =    Init Date
    Log in Alfresco    ${Username}    ${Password}
    Creer un compte utilisateur    ${vPrenomUser}${date_current1}    ${date_current1}${vEmailUser}    ${vNomUser}${date_current1}    ${vPasswordUser}${date_current1}
    Sleep    5s
    Log Out Alfresco
    Close Browser

    ##Pre-condition:Creer un site prive avec le compte utilisateur1
    Log    Pre-condition Creer un site prive avec le compte utilisateur1
    ${date_current2} =    Init Date
    #login au tant que utilisateur1
    Log in Alfresco    ${vNomUser}${date_current1}    ${vPasswordUser}${date_current1}
    Creer un site prive    ${vNomSite}${date_current2}    ${vUrlSite}${date_current2}    ${vDescriptionSite}${date_current2}
    Sleep    8s
    Log out Alfresco
    Close Browser
    
    ##Test Case
    Log     Test Case
    #login au tant que utilisateur de test
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
    Input Text    ${txt_RechercheSite}    ${vNomSite}${date_current2}
    #presser sur Return sur le clavier
    Press Keys    ${txt_RechercheSite}    RETURN
    Sleep    5s
    Wait Until Element Is Visible    ${btn_RejoindreSiteCiblePart1}${vNomSite}${date_current2}${btn_RejoindreSiteCiblePart2}
    #cliquer sur le boutton Rejoindre de site cilbe
    Click Element    ${btn_RejoindreSiteCiblePart1}${vNomSite}${date_current2}${btn_RejoindreSiteCiblePart2}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Criteres de succes: utilisateur de test est dans la liste de membres En attente
    Log    Criteres de succes
    Log in Alfresco    ${vNomUser}${date_current1}    ${vPasswordUser}${date_current1}
    #cliquer sur le lien Sites
    Click Element    ${link_HeaderSites}    
    Wait Until Element Is Visible    ${link_HeaderMesSites}
    #cliquer sur le lien Mes sites
    Click Element    ${link_HeaderMesSites}
    Wait Until Page Contains Element    ${link_SiteCiblePart1}${vNomSite}${date_current2}${link_SiteCiblePart2}
    #cliquer sur le lien de site
    Click Element    ${link_SiteCiblePart1}${vNomSite}${date_current2}${link_SiteCiblePart2}
    Wait Until Page Contains Element    ${link_SiteAllMembres}
    #cliquer sur le lien Tous les membres
    Click Element    ${link_SiteAllMembres}
    Wait Until Page Contains Element    ${link_SitePendingInvites}
    #cliquer sur le lien En attente
    Click Element    ${link_SitePendingInvites}
    #verifier si la page contient utilisateur2
    Page Should Contain Element    ${link_NomMembreCiblePart1}${Username}${link_NomMembreCiblePart2}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Post-conditions: Supprimer le site, Supprimer le compte utilisateur, Vider corbeille
    Log    Post-conditions
    Log in Alfresco    ${vNomUser}${date_current1}    ${vPasswordUser}${date_current1}
    Supprimer un site    ${vNomSite}${date_current2}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    Log in Alfresco    ${Username}    ${Password}
    Supprimer un compte utilisateur    ${vPrenomUser}${date_current1}
    Sleep    2s
    Vider corbeille
    Sleep    3s
    Log Out Alfresco
    Close Browser