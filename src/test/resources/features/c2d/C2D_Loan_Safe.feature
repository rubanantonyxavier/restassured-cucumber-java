@api
@c2d
Feature: C2D for Loan Safe

  @C2D-11
  Scenario: [C2D-11] Verify C2D LSFM Order User
    Given the request XML filepath is /c2d/C2D-11.xml
    When the C2D request is sent with ORDER User
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the response contains xpath
      | //RESPONSE_GROUP/RESPONSE/RESPONSE_DATA/PROPERTY_INFORMATION_RESPONSE/STATUS                                               |
      | //RESPONSE_GROUP//PROPERTY_INFORMATION_RESPONSE/_PROPERTY_INFORMATION                                                      |
      | //_PROPERTY_INFORMATION/_CORE_ANALYTICS/SUBMISSION/REQUESTS/REQUEST/RESULTS/RESULT/CL_DOCUMENT                             |
      | //_PROPERTY_INFORMATION//REQUESTS//RESULTS//PROPERTIES/CL_PROPERTY/PROPERTYKEY[text()='CONVERTED_DOCUMENT']                |
      | //_PROPERTY_INFORMATION//REQUESTS//RESULTS//PROPERTIES/CL_PROPERTY[PROPERTYKEY[text()='CONVERTED_DOCUMENT']]/PROPERTYVALUE |
    And the response has xpath
      | XPath                                                              | expected             |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Code                      | 0400                 |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Condition                 | SUCCESSFUL           |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Code             | 0500                 |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Condition        | SUCCESSFUL           |
      | //PROPERTY_INFORMATION_RESPONSE/_PROPERTY_INFORMATION/@_ReportType | LoanSafeFraudManager |
    Then extract the content of xpath //_PROPERTY_INFORMATION/_CORE_ANALYTICS/SUBMISSION/REQUESTS/REQUEST/RESULTS/RESULT/CL_DOCUMENT from XML response
    And the HTML response contains xpath
      | //table[@class='FM_data FM_header_info_1']          |
      | //table[@class='FM_data FM_header_info_2']          |
      | //div[@id='child']/table[@class='FM_Score_Display'] |
      | //table[@class='FM_fraudAlert']                     |
      | //table[@class='FM_searchSummary']                  |
      | //div[@id='disclaimer']                             |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected                               |
      | //table[@class='FM_data FM_header_info_1']//tr[2]/td[1]/b | REPORT INFORMATION                     |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[1]/b | Report Order No.                       |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[2]   | [NOT EMPTY]                            |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[1]/b | LOAN INFORMATION                       |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[2]/b | BORROWER INFORMATION                   |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[3]/b | EMPLOYMENT INFORMATION                 |
      | //div[@class='FM_Number_Score FM_Not_Rescorable']         | [MATCH --> Fraud Risk Score: \\d{1,3}] |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                 |
      | //div[@id='header']//img                                  | /PCFRSWebElements/images/ui/lsfm/logos/ls_fraud_logo.gif                 |
      | //div[@id='FM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/lsfm/fraud_alert_white.gif                   |
      | //div[@id='searchSummary']/img                            | /PCFRSWebElements/images/ui/lsfm/confirmation_search_performed_white.gif |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/property_detail_white.gif               |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                 |
      | //div[@id='identityDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/identity_detail_white.gif               |
      | //div[@id='incomeDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/income_detail_white.gif                 |
      | //div[@id='borrowerDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/borrower_detail_white.gif               |
      | //div[@id='brokerDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/third_party_detail_white.gif            |
      | //div[@id='marketDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif                 |
    And the HTML response has xpath with MAP content
      | XPath                                                   | expected   |
      | //div[@id='HP_AREA_MAP']//div[@class='map']             | RoadMap    |
      | //div[@id='IV_EMP_SITEMAP0']//div[@class='employerMap'] | EmpSiteMap |

  @C2D-12
  Scenario: [C2D-12] Verify C2D LSCM Order User
    Given the request XML filepath is /c2d/C2D-12.xml
    When the C2D request is sent with ORDER User
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the response contains xpath
      | //RESPONSE_GROUP/RESPONSE/RESPONSE_DATA/PROPERTY_INFORMATION_RESPONSE/STATUS                                            |
      | //RESPONSE_GROUP//PROPERTY_INFORMATION_RESPONSE/_PROPERTY_INFORMATION                                                   |
      | //_PROPERTY_INFORMATION/_CORE_ANALYTICS/SUBMISSION/REQUESTS/REQUEST/RESULTS/RESULT/CL_DOCUMENT                          |
      | //_PROPERTY_INFORMATION//REQUESTS//RESULTS//PROPERTIES/PROPERTY/PROPERTYKEY[text()='CONVERTED_DOCUMENT']                |
      | //_PROPERTY_INFORMATION//REQUESTS//RESULTS//PROPERTIES/PROPERTY[PROPERTYKEY[text()='CONVERTED_DOCUMENT']]/PROPERTYVALUE |
    And the response has xpath
      | XPath                                                              | expected                  |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Code                      | 0400                      |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Condition                 | SUCCESSFUL                |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Code             | 0500                      |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Condition        | SUCCESSFUL                |
      | //PROPERTY_INFORMATION_RESPONSE/_PROPERTY_INFORMATION/@_ReportType | LoanSafeCollateralManager |
    Then extract the content of xpath //_PROPERTY_INFORMATION/_CORE_ANALYTICS/SUBMISSION/REQUESTS/REQUEST/RESULTS/RESULT/CL_DOCUMENT from XML response
    And the HTML response contains xpath
      | //table[@class='CM_data CM_header_info_1']               |
      | //table[@class='CM_data CM_header_info_2']               |
      | //div[@class='CM_scale']                                 |
      | //div[@id='CM_collateralAlert']/table[@class='CM_alert'] |
      | //div[@id='CM_fraudAlert']/table[@class='CM_alert']      |
      | //div[@id='disclaimer']                                  |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected               |
      | //table[@class='CM_data CM_header_info_1']//tr[1]//span   | REPORT INFORMATION     |
      | //table[@class='CM_data CM_header_info_1']//tr[2]/td[1]/b | Report Order No.       |
      | //table[@class='CM_data CM_header_info_1']//tr[2]/td[2]   | [NOT EMPTY]            |
      | //table[@class='CM_data CM_header_info_2']//tr[1]//span   | LOAN INFORMATION       |
      | //div[@class='CM_score']/span/text()                      | Collateral Risk Score: |
      | //div[@class='CM_score']/span/span                        | [NOT EMPTY]            |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                              |
      | //table[@class='CM_header']//img                          | /PCFRSWebElements/images/ui/collateralManager/loanSafeCollateralManagerReport2014.png |
      | //div[@id='CM_collateralAlert']/img                       | /PCFRSWebElements/images/ui/collateralManager//collateral_alert_white.gif             |
      | //div[@id='CM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/collateralManager/fraud_alert_white.gif                   |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/property_detail_white.gif                                    |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                              |
    And the HTML response has xpath with MAP content
      | XPath                                       | expected |
      | //div[@id='HP_AREA_MAP']//div[@class='map'] | RoadMap  |

  @C2D-13
  Scenario: [C2D-13] Verify C2D LSRM Order User
    Given the request XML filepath is /c2d/C2D-13.xml
    When the C2D request is sent with ORDER User
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the response contains xpath
      | //RESPONSE_GROUP/RESPONSE/RESPONSE_DATA/PROPERTY_INFORMATION_RESPONSE/STATUS                                               |
      | //RESPONSE_GROUP//PROPERTY_INFORMATION_RESPONSE/_PROPERTY_INFORMATION                                                      |
      | //_PROPERTY_INFORMATION/_CORE_ANALYTICS/SUBMISSION/REQUESTS/REQUEST/RESULTS/RESULT/CL_DOCUMENT                             |
      | //_PROPERTY_INFORMATION//REQUESTS//RESULTS//PROPERTIES/CL_PROPERTY/PROPERTYKEY[text()='CONVERTED_DOCUMENT']                |
      | //_PROPERTY_INFORMATION//REQUESTS//RESULTS//PROPERTIES/CL_PROPERTY[PROPERTYKEY[text()='CONVERTED_DOCUMENT']]/PROPERTYVALUE |
    And the response has xpath
      | XPath                                                              | expected            |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Code                      | 0400                |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Condition                 | SUCCESSFUL          |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Code             | 0500                |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Condition        | SUCCESSFUL          |
      | //PROPERTY_INFORMATION_RESPONSE/_PROPERTY_INFORMATION/@_ReportType | LoanSafeRiskManager |
    Then extract the content of xpath //_PROPERTY_INFORMATION/_CORE_ANALYTICS/SUBMISSION/REQUESTS/REQUEST/RESULTS/RESULT/CL_DOCUMENT from XML response
    And the HTML response contains xpath
      | //table[@class='FM_data FM_header_info_1']                       |
      | //table[@class='FM_data FM_header_info_2']                       |
      | //div[@id='FM_fraudAlert']//table[@class='FM_Score_Display']     |
      | //div[@id='FM_fraudAlerts']/table[@class='FM_fraudAlert']        |
      | //div[@id='FM_appraisalAlert']//table[@class='FM_Score_Display'] |
      | //div[@id='FM_fraudAlerts']/../table[@class='FM_fraudAlert']     |
      | //table[@class='FM_searchSummary']                               |
      | //div[@id='disclaimer']                                          |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected                               |
      | //table[@class='FM_data FM_header_info_1']//tr[2]/td[1]/b | REPORT INFORMATION                     |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[1]/b | Report Order No.                       |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[2]   | [NOT EMPTY]                            |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[1]/b | LOAN INFORMATION                       |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[2]/b | BORROWER INFORMATION                   |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[3]/b | EMPLOYMENT INFORMATION                 |
      | //div[starts-with(@class,'FM_Number_Score FM_')]          | [MATCH --> Fraud Risk Score: \\d{1,3}] |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                 |
      | //div[@id='header']//img                                  | /PCFRSWebElements/images/ui/lsrm/logos/ls_risk_logo_2014.png             |
      | //div[@id='FM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/lsrm/fraud_alert_white.gif                   |
      | //div[@id='searchSummary']/img                            | /PCFRSWebElements/images/ui/lsrm/confirmation_search_performed_white.gif |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/ui/lsrm/property_detail_white.gif               |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                 |
      | //div[@id='identityDetail']/img                           | /PCFRSWebElements/images/ui/lsrm/identity_detail_white.gif               |
      | //div[@id='incomeDetail']/img                             | /PCFRSWebElements/images/ui/lsrm/income_detail_white.gif                 |
      | //div[@id='borrowerDetail']/img                           | /PCFRSWebElements/images/ui/lsrm/borrower_detail_white.gif               |
      | //div[@id='brokerDetail']/img                             | /PCFRSWebElements/images/ui/lsrm/third_party_detail_white.gif            |
      | //div[@id='marketDetail']/img                             | /PCFRSWebElements/images/ui/lsrm/market_detail_white.gif                 |
    And the HTML response has xpath with MAP content
      | XPath                                                   | expected   |
      | //div[@id='HP_AREA_MAP']//div[@class='map']             | RoadMap    |
      | //div[@id='IV_EMP_SITEMAP0']//div[@class='employerMap'] | EmpSiteMap |

  @C2D-15
  Scenario: [C2D-15] Verify C2D LSFM Contract User
    Given the request XML filepath is /c2d/C2D-15.xml
    When the C2D request is sent with CONTRACT User
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the response contains xpath
      | //RESPONSE_GROUP/RESPONSE/RESPONSE_DATA/PROPERTY_INFORMATION_RESPONSE/STATUS                              |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT                                                                    |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='XML']/DOCUMENT  |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/DOCUMENT  |
    And the response has xpath
      | XPath                                                                                                        | expected             |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Code                                                                | 0400                 |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Condition                                                           | SUCCESSFUL           |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Code                                                       | 0500                 |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Condition                                                  | SUCCESSFUL           |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/@_ReportType                                                          | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_Name                    | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_Name                   | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_Name                    | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_EncodingTypeIdentifier  | text/xml             |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_EncodingTypeIdentifier | text/html            |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_EncodingTypeIdentifier  | Base64Binary         |
    Then extract the content of xpath //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT from XML response
    And the HTML response contains xpath
      | //table[@class='FM_data FM_header_info_1']          |
      | //table[@class='FM_data FM_header_info_2']          |
      | //div[@id='child']/table[@class='FM_Score_Display'] |
      | //table[@class='FM_fraudAlert']                     |
      | //table[@class='FM_searchSummary']                  |
      | //div[@id='disclaimer']                             |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected                               |
      | //table[@class='FM_data FM_header_info_1']//tr[2]/td[1]/b | REPORT INFORMATION                     |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[1]/b | Report Order No.                       |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[2]   | [NOT EMPTY]                            |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[1]/b | LOAN INFORMATION                       |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[2]/b | BORROWER INFORMATION                   |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[3]/b | EMPLOYMENT INFORMATION                 |
      | //div[@class='FM_Number_Score FM_Not_Rescorable']         | [MATCH --> Fraud Risk Score: \\d{1,3}] |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                 |
      | //div[@id='header']//img                                  | /PCFRSWebElements/images/ui/lsfm/logos/ls_fraud_logo.gif                 |
      | //div[@id='FM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/lsfm/fraud_alert_white.gif                   |
      | //div[@id='searchSummary']/img                            | /PCFRSWebElements/images/ui/lsfm/confirmation_search_performed_white.gif |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/property_detail_white.gif               |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                 |
      | //div[@id='identityDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/identity_detail_white.gif               |
      | //div[@id='incomeDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/income_detail_white.gif                 |
      | //div[@id='borrowerDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/borrower_detail_white.gif               |
      | //div[@id='brokerDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/third_party_detail_white.gif            |
      | //div[@id='marketDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif                 |
    And the HTML response has xpath with MAP content
      | XPath                                                   | expected   |
      | //div[@id='HP_AREA_MAP']//div[@class='map']             | RoadMap    |
      | //div[@id='IV_EMP_SITEMAP0']//div[@class='employerMap'] | EmpSiteMap |
    Then extract the content of xpath //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='XML']/DOCUMENT from XML response
    And the response has xpath
      | XPath                                      | expected           |
      | //ReportResults/LSFM/Fraud/@id             | FRAUDMARK-LSFM 4.1 |
      | //ReportResults/LSFM/Fraud/@fraudModelName | FRAUDMARK-LSFM4.1  |

  @C2D-16
  Scenario: [C2D-16] Verify C2D LSCM Contract User
    Given the request XML filepath is /c2d/C2D-16.xml
    When the C2D request is sent with CONTRACT User
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the response contains xpath
      | //RESPONSE_GROUP/RESPONSE/RESPONSE_DATA/PROPERTY_INFORMATION_RESPONSE/STATUS                              |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT                                                                    |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='XML']/DOCUMENT  |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/DOCUMENT  |
    And the response has xpath
      | XPath                                                                                                        | expected                  |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Code                                                                | 0400                      |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Condition                                                           | SUCCESSFUL                |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Code                                                       | 0500                      |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Condition                                                  | SUCCESSFUL                |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/@_ReportType                                                          | LoanSafeCollateralManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_Name                    | LoanSafeCollateralManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_Name                   | LoanSafeCollateralManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_Name                    | LoanSafeCollateralManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_EncodingTypeIdentifier  | text/xml                  |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_EncodingTypeIdentifier | text/html                 |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_EncodingTypeIdentifier  | Base64Binary              |
    Then extract the content of xpath //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT from XML response
    And the HTML response contains xpath
      | //table[@class='CM_data CM_header_info_1']               |
      | //table[@class='CM_data CM_header_info_2']               |
      | //div[@class='CM_scale']                                 |
      | //div[@id='CM_collateralAlert']/table[@class='CM_alert'] |
      | //div[@id='CM_fraudAlert']/table[@class='CM_alert']      |
      | //div[@id='disclaimer']                                  |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected               |
      | //table[@class='CM_data CM_header_info_1']//tr[1]//span   | REPORT INFORMATION     |
      | //table[@class='CM_data CM_header_info_1']//tr[2]/td[1]/b | Report Order No.       |
      | //table[@class='CM_data CM_header_info_1']//tr[2]/td[2]   | [NOT EMPTY]            |
      | //table[@class='CM_data CM_header_info_2']//tr[1]//span   | LOAN INFORMATION       |
      | //div[@class='CM_score']/span/text()                      | Collateral Risk Score: |
      | //div[@class='CM_score']/span/span                        | [NOT EMPTY]            |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                              |
      | //table[@class='CM_header']//img                          | /PCFRSWebElements/images/ui/collateralManager/loanSafeCollateralManagerReport2014.png |
      | //div[@id='CM_collateralAlert']/img                       | /PCFRSWebElements/images/ui/collateralManager//collateral_alert_white.gif             |
      | //div[@id='CM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/collateralManager/fraud_alert_white.gif                   |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/property_detail_white.gif                                    |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                              |
    And the HTML response has xpath with MAP content
      | XPath                                       | expected |
      | //div[@id='HP_AREA_MAP']//div[@class='map'] | RoadMap  |

  @C2D-17
  Scenario: [C2D-17] Verify C2D LSRM Contract User
    Given the request XML filepath is /c2d/C2D-17.xml
    When the C2D request is sent with CONTRACT User
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the response contains xpath
      | //RESPONSE_GROUP/RESPONSE/RESPONSE_DATA/PROPERTY_INFORMATION_RESPONSE/STATUS                              |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT                                                                    |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='XML']/DOCUMENT  |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/DOCUMENT  |
    And the response has xpath
      | XPath                                                                                                        | expected            |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Code                                                                | 0400                |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Condition                                                           | SUCCESSFUL          |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Code                                                       | 0500                |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Condition                                                  | SUCCESSFUL          |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/@_ReportType                                                          | LoanSafeRiskManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_Name                    | LoanSafeRiskManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_Name                   | LoanSafeRiskManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_Name                    | LoanSafeRiskManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_EncodingTypeIdentifier  | text/xml            |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_EncodingTypeIdentifier | text/html           |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_EncodingTypeIdentifier  | Base64Binary        |
    Then extract the content of xpath //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT from XML response
    And the HTML response contains xpath
      | //table[@class='FM_data FM_header_info_1']                       |
      | //table[@class='FM_data FM_header_info_2']                       |
      | //div[@id='FM_fraudAlert']//table[@class='FM_Score_Display']     |
      | //div[@id='FM_fraudAlerts']/table[@class='FM_fraudAlert']        |
      | //div[@id='FM_appraisalAlert']//table[@class='FM_Score_Display'] |
      | //div[@id='FM_fraudAlerts']/../table[@class='FM_fraudAlert']     |
      | //table[@class='FM_searchSummary']                               |
      | //div[@id='disclaimer']                                          |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected                               |
      | //table[@class='FM_data FM_header_info_1']//tr[2]/td[1]/b | REPORT INFORMATION                     |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[1]/b | Report Order No.                       |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[2]   | [NOT EMPTY]                            |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[1]/b | LOAN INFORMATION                       |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[2]/b | BORROWER INFORMATION                   |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[3]/b | EMPLOYMENT INFORMATION                 |
      | //div[@class='FM_Number_Score FM_Not_Rescorable']         | [MATCH --> Fraud Risk Score: \\d{1,3}] |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                 |
      | //div[@id='header']//img                                  | /PCFRSWebElements/images/ui/lsrm/logos/ls_risk_logo_2014.png             |
      | //div[@id='FM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/lsrm/fraud_alert_white.gif                   |
      | //div[@id='searchSummary']/img                            | /PCFRSWebElements/images/ui/lsrm/confirmation_search_performed_white.gif |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/ui/lsrm/property_detail_white.gif               |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                 |
      | //div[@id='identityDetail']/img                           | /PCFRSWebElements/images/ui/lsrm/identity_detail_white.gif               |
      | //div[@id='incomeDetail']/img                             | /PCFRSWebElements/images/ui/lsrm/income_detail_white.gif                 |
      | //div[@id='borrowerDetail']/img                           | /PCFRSWebElements/images/ui/lsrm/borrower_detail_white.gif               |
      | //div[@id='brokerDetail']/img                             | /PCFRSWebElements/images/ui/lsrm/third_party_detail_white.gif            |
      | //div[@id='marketDetail']/img                             | /PCFRSWebElements/images/ui/lsrm/market_detail_white.gif                 |
    And the HTML response has xpath with MAP content
      | XPath                                                   | expected   |
      | //div[@id='HP_AREA_MAP']//div[@class='map']             | RoadMap    |
      | //div[@id='IV_EMP_SITEMAP0']//div[@class='employerMap'] | EmpSiteMap |

  @C2D-18
  Scenario: [C2D-18] Verify C2D LSFM Contract User with Fraud Mark 4.0
    Given the request XML filepath is /c2d/C2D-18.xml
    When the C2D request is sent with CONTRACT2 User
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the response contains xpath
      | //RESPONSE_GROUP/RESPONSE/RESPONSE_DATA/PROPERTY_INFORMATION_RESPONSE/STATUS                              |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT                                                                    |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='XML']/DOCUMENT  |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/DOCUMENT  |
    And the response has xpath
      | XPath                                                                                                        | expected             |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Code                                                                | 0400                 |
      | //PROPERTY_INFORMATION_RESPONSE/STATUS/@_Condition                                                           | SUCCESSFUL           |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Code                                                       | 0500                 |
      | //PROPERTY_INFORMATION_RESPONSE/_PRODUCT/STATUS/@_Condition                                                  | SUCCESSFUL           |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT/@_ReportType                                                          | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_Name                    | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_Name                   | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_Name                    | LoanSafeFraudManager |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='XML']/@_EncodingTypeIdentifier  | text/xml             |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/@_EncodingTypeIdentifier | text/html            |
      | //PROPERTY_INFORMATION_RESPONSE/REPORT//EMBEDDED_FILE[@_ExtensionIdentifier='PDF']/@_EncodingTypeIdentifier  | Base64Binary         |
    Then extract the content of xpath //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='HTML']/DOCUMENT from XML response
    And the HTML response contains xpath
      | //table[@class='FM_data FM_header_info_1']          |
      | //table[@class='FM_data FM_header_info_2']          |
      | //div[@id='child']/table[@class='FM_Score_Display'] |
      | //table[@class='FM_fraudAlert']                     |
      | //table[@class='FM_searchSummary']                  |
      | //div[@id='disclaimer']                             |
    And the HTML response has xpath with TEXT content
      | XPath                                                     | expected                               |
      | //table[@class='FM_data FM_header_info_1']//tr[2]/td[1]/b | REPORT INFORMATION                     |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[1]/b | Report Order No.                       |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[2]   | [NOT EMPTY]                            |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[1]/b | LOAN INFORMATION                       |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[2]/b | BORROWER INFORMATION                   |
      | //table[@class='FM_data FM_header_info_2']//tr[1]/td[3]/b | EMPLOYMENT INFORMATION                 |
      | //div[@class='FM_Number_Score FM_Not_Rescorable']         | [MATCH --> Fraud Risk Score: \\d{1,3}] |
    And the HTML response has xpath with IMAGE content
      | XPath                                                     | expected                                                                 |
      | //div[@id='header']//img                                  | /PCFRSWebElements/images/ui/lsfm/logos/ls_fraud_logo.gif                 |
      | //div[@id='FM_fraudAlert']/img                            | /PCFRSWebElements/images/ui/lsfm/fraud_alert_white.gif                   |
      | //div[@id='searchSummary']/img                            | /PCFRSWebElements/images/ui/lsfm/confirmation_search_performed_white.gif |
      | //div[@id='propertyDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/property_detail_white.gif               |
      | //div[@id='HP_HEAT_MAP']//div[@class='CM_mapBorder']//img | loansafe_full_sale_J.gif                                                 |
      | //div[@id='identityDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/identity_detail_white.gif               |
      | //div[@id='incomeDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/income_detail_white.gif                 |
      | //div[@id='borrowerDetail']/img                           | /PCFRSWebElements/images/ui/lsfm/borrower_detail_white.gif               |
      | //div[@id='brokerDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/third_party_detail_white.gif            |
      | //div[@id='marketDetail']/img                             | /PCFRSWebElements/images/ui/lsfm/market_detail_white.gif                 |
    And the HTML response has xpath with MAP content
      | XPath                                                   | expected   |
      | //div[@id='HP_AREA_MAP']//div[@class='map']             | RoadMap    |
      | //div[@id='IV_EMP_SITEMAP0']//div[@class='employerMap'] | EmpSiteMap |
    Then extract the content of xpath //PROPERTY_INFORMATION_RESPONSE/REPORT/REPORT_RESULT/EMBEDDED_FILE[@_ExtensionIdentifier='XML']/DOCUMENT from XML response
    And the response has xpath
      | XPath                                      | expected           |
      | //ReportResults/LSFM/Fraud/@id             | FRAUDMARK-LSFM 4.0 |
      | //ReportResults/LSFM/Fraud/@fraudModelName | FRAUDMARK-LSFM4    |