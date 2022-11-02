@api
@non_fcra
@lsfm
@html
@general
@section
Feature: LSFM HTML General Section

  @MADLRVP-2560
  Scenario: [MADLRVP-2560] Verify LSFM HTML - General Section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-2560.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response contains xpath
      | //table[@class='FM_data FM_header_info_1']          |
      | //table[@class='FM_data FM_header_info_2']          |
      | //div[@id='FM_fraudAlert']                          |
      | //div[@id='child']/table[@class='FM_Score_Display'] |
      | //div[@id='lsfm']/table[@class='FM_Score_Display']  |
      | //table[@class='FM_fraudAlert']                     |
      | //table[@class='FM_searchSummary']                  |
      | //div[@id='disclaimer']                             |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected               |
      | //table[@class='FM_data FM_header_info_1']//tr[2]/td[1]/b | REPORT INFORMATION     |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[1]/b | LOAN INFORMATION       |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[2]/b | BORROWER INFORMATION   |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[3]/b | EMPLOYMENT INFORMATION |
      | //table[@class='FM_Score_Display']//b                     | TOP SCORE CONTRIBUTORS |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                 |
      | //div[@id='header']//img                                  | /PCFRSWebElements/images/ui/lsfm/logos/ls_fraud_logo.gif                 |
      | //div[@id='FM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/lsfm/fraud_alert_white.gif                   |
      | //div[@id='searchSummary']/img                            | /PCFRSWebElements/images/ui/lsfm/confirmation_search_performed_white.gif |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/property_detail_white.gif               |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_I.gif                                                 |
      | //div[@id='identityDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/identity_detail_white.gif               |
      | //div[@id='incomeDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/income_detail_white.gif                 |
      | //div[@id='borrowerDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/borrower_detail_white.gif               |
      | //div[@id='brokerDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/third_party_detail_white.gif            |
      | //div[@id='marketDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif                 |
    And the HTML response has xpath with MAP content
      | XPath                                                   | expected   |
      | //div[@id='HP_AREA_MAP']//div[@class='map']             | RoadMap    |
      | //div[@id='IV_EMP_SITEMAP0']//div[@class='employerMap'] | EmpSiteMap |

  @MADLRVP-9167
  Scenario: [MADLRVP-9167] Verify LSFM HTML - Disclaimer at the bottom
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9167.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath //div[@id='disclaimer'] with value (ignoring newline and spaces)
    """
    NOTICES: This report has been produced solely for the benefit and use of CoreLogic's customer
    subject to the terms of the contract between the parties. This report is not an appraisal of the
    subject property and contains no independent valuation or value estimate. This report may also
    include the optional WatchList Screening feature; in addition to the input borrower name(s), AKA
    (also-known-as) names found, or when available, for the input borrower(s) will be screened
    against the various watch lists available and turned on for the end-user party. The use of AKA
    names for WatchList Screening is only applicable to the input borrower name(s). With the
    exception of the party that ordered this report, no party receiving a copy of this report may
    rely on any of the information contained in it. CoreLogic shall have no liability to any third
    party receiving a copy of this report for any claims related to any information included in the
    report. If you are not a customer of CoreLogic and have any questions about this report or the
    information contained in it, please contact the party that ordered this report.
    This product uses FHFA data but is neither endorsed nor certified by FHFA.
    """




