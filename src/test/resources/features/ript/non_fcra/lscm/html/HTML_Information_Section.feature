@api
@non_fcra
@lscm
@html
@information
@section
Feature: LSCM HTML Information Section

  @report
    @MADLRVP-14161
  Scenario Outline: [MADLRVP-14161] Verify LSCM HTML - REPORT INFORMATION section
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14161.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                        | expected                          |
      | <section_xpath>//tr/td[@class='header']/span | REPORT INFORMATION                |
      | <section_xpath>//tr[2]/td[1]/b               | Report Order No.                  |
      | <section_xpath>//tr[2]/td[2]                 | [NOT EMPTY]                       |
      | <section_xpath>//tr[2]/td[3]/b               | Report Date                       |
      | <section_xpath>//tr[2]/td[4]                 | [DATETIME --> MMM d, yyyy h:mm a] |
      | <section_xpath>//tr[3]/td[1]/b               | Standardized Property Address     |
      | <section_xpath>//tr[3]/td[2]                 | [NOT EMPTY]                       |
      | <section_xpath>//tr[3]/td[3]/b               | Input Property Address            |
      | <section_xpath>//tr[3]/td[4]                 | [NOT EMPTY]                       |
      | <section_xpath>//tr[4]/td[1]/b               | APN                               |
      | <section_xpath>//tr[4]/td[2]                 | [NOT EMPTY]                       |
      | <section_xpath>//tr[5]/td[1]/b               | Mailing Address                   |
      | <section_xpath>//tr[5]/td[2]                 | [NOT EMPTY]                       |
      | <section_xpath>//tr[6]/td[1]/b               | Retro Date                        |
      | <section_xpath>//tr[6]/td[2]                 | [DATE --> MMM d, yyyy]            |
    And the HTML response has xpath with IMAGE content
      | XPath                              | expected                                        |
      | <section_xpath>//tr[3]/td[1]/a/img | /PCFRSWebElements/images/ui/lsfm/faq_button.png |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                          | expected                                         |
      | <section_xpath>//tr[5]/td[1]/a | /PCFRSWebElements/html/subject_property_faq.html |

    Examples:
      | section_xpath                              |
      | //table[@class='CM_data CM_header_info_1'] |

  @loan
    @MADLRVP-14162
  Scenario Outline: [MADLRVP-14162] Verify LSCM HTML - LOAN INFORMATION section
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14162.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                           | expected                 |
      | <section_xpath>//tr/td[@class='header'][1]/span | LOAN INFORMATION         |
      | <section_xpath>//tr[2]/td[1]/b                  | Loan Number              |
      | <section_xpath>//tr[2]/td[2]                    | [NOT EMPTY]              |
      | <section_xpath>//tr[3]/td[1]/b                  | Loan Purpose             |
      | <section_xpath>//tr[3]/td[2]                    | [NOT EMPTY]              |
      | <section_xpath>//tr[4]/td[1]/b                  | Loan Amount              |
      | <section_xpath>//tr[4]/td[2]                    | [MATCH --> \\$[\\d,]+]   |
      | <section_xpath>//tr[5]/td[1]/b                  | Reported Appraised Value |
      | <section_xpath>//tr[5]/td[2]                    | [NOT EMPTY]              |

    Examples:
      | section_xpath                              |
      | //table[@class='CM_data CM_header_info_2'] |

  @risk_score
    @MADLRVP-14163
  Scenario Outline: [MADLRVP-14163] Verify LSCM HTML - RISK SCORE section
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14163.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                             | expected                                                                               |
      | <scale_xpath>/img[1]              | /PCFRSWebElements/images/ui/collateralManager/loansafe_collateral_score_scale_bar2.gif |
      | <scale_xpath>/img[@class="scale"] | /PCFRSWebElements/images/ui/collateralManager/fraud_scale_2.gif                        |
    And the HTML response has xpath with TEXT content
      | XPath                    | expected                                       |
      | //div[@class='CM_score'] | [MATCH --> Collateral Risk Score:\\s*\\d{1,3}] |

    Examples:
      | scale_xpath              |
      | //div[@class='CM_scale'] |
