*** Settings ***
Documentation    AjouterUnCommentaireAUnBlog
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
${vTitreArticle}    TitreArticleXue
${vTexteArticle}    TexteArticleXue
${vCommentaire}    IciCommentaire
${vNomSite}    SiteXue
${vUrlSite}    Url
${vDescriptionSite}    Description
${vVisbilitySite}    PUBLIC

*** Test Cases ***
RQ3.BF9.4: Ajouter Un Commentaire a Un Blog
    Set Selenium Timeout    ${TIMEOUT}
    ${date_current} =    Init Date
    ##Pre-condition:Creer un article dans le blog du site
    Log    Pre-condition
    Log in Alfresco    ${Username}    ${Password}
    Create Un Site Complet    ${vNomSite}${date_current}    ${vUrlSite}${date_current}    ${vDescriptionSite}${date_current}    ${vVisbilitySite}
    Sleep    3s
    Creer un article dans le blog du site    ${vNomSite}${date_current}    ${vTitreArticle}${date_current}    ${vTexteArticle}
    Sleep    3s
    Log Out Alfresco
    Close Browser

    ##Test Case
    Log    Test Case
    Log in Alfresco    ${Username}    ${Password}
    #cliquer sur le lien Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    ${link_HeaderMesSites}
    #cliquer sur le lien Mes sites
    Click Element    ${link_HeaderMesSites}
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    ${link_SiteCiblePart1}${vNomSite}${link_SiteCiblePart2}
    #cliquer sur le lien du site cible
    Click Element    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #cliquer sur le lien Blog
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    ${link_BlogSite}
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_PlusPageSite}
    #wait until le lien Blog est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    ${link_BlogSite}
    #cliquer sur le lien Blog
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_BlogSite}
    Sleep    2s
    #wait until le lien Tous est visible
    Wait Until Element Is Visible    ${link_TousArticleSite}
    #cliquer sur le lien Tous
    Click Element    ${link_TousArticleSite}
    #wait until le lien de article est visible
    Wait Until Element Is Visible    ${link_ArticleCiblePart1}${vTitreArticle}${date_current}${link_ArticleCiblePart2}
    Sleep    2s
    #cliquer sur le lien de article
    Click Element    ${link_ArticleCiblePart1}${vTitreArticle}${date_current}${link_ArticleCiblePart2}
    #wait until la page contient le bouton
    Wait Until Page Contains Element    ${btn_AjouterCommentaire}
    #cliquer sur le bouton Ajouter un commentaire
    Click Button    ${btn_AjouterCommentaire}
    Sleep    2s
    Select Frame    ${frame_CommentaireArticleBlog}
    Input Text    ${txt_CommentaireArticleBlog}    ${vCommentaire}
    Unselect Frame
    #cliquer sur le bouton Ajouter un commentaire
    Click Button    ${btn_EnregistrerCommentaire}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Criteres de succes: la page doit contenir le commentaire
    Log    Criteres de succes
    Log in Alfresco    ${Username}    ${Password}
    #cliquer sur le lien Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    ${link_HeaderMesSites}
    #cliquer sur le lien Mes sites
    Click Element    ${link_HeaderMesSites}
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #cliquer sur le lien du site cible
    Click Element    ${link_SiteCiblePart1}${vNomSite}${date_current}${link_SiteCiblePart2}
    #cliquer sur le lien Blog
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    ${link_BlogSite}
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_PlusPageSite}
    #wait until le lien Blog est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    ${link_BlogSite}
    #cliquer sur le lien Blog
    Run Keyword If    '${statut}'=='FAIL'    Click Element    ${link_BlogSite}
    Sleep    2s
    #wait until le lien Tous est visible
    Wait Until Element Is Visible    ${link_TousArticleSite}
    #cliquer sur le lien Tous
    Click Element    ${link_TousArticleSite}
    #wait until le lien de article est visible
    Wait Until Element Is Visible    ${link_ArticleCiblePart1}${vTitreArticle}${date_current}${link_ArticleCiblePart2}
    Sleep    2s
    #cliquer sur le lien de article
    Click Element    ${link_ArticleCiblePart1}${vTitreArticle}${date_current}${link_ArticleCiblePart2}
    Sleep    2s
    #verifier si la page contenir le commentaire
    Page Should Contain Element    ${txt_CommentaireAjoutePart1}${vCommentaire}${txt_CommentaireAjoutePart2}
    Sleep    2s
    Log Out Alfresco
    Close Browser

    ##Post-conditions: Supprimer article dans le blog, Vider corbeille
    Log    Post-conditions
    Log in Alfresco    ${Username}    ${Password}
    Supprimer un article dans un blog    ${vNomSite}${date_current}    ${vTitreArticle}${date_current}
    Sleep    2s
    Supprimer un site    ${vNomSite}${date_current}
    Sleep    2s
    Vider corbeille
    Sleep    2s
    Log Out Alfresco
    Close Browser
