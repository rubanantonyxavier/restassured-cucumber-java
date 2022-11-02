@api
@non_fcra
@lsfm
@output_modes
Feature: LSFM - Different Output Modes

  @MADLRVP-15205
  Scenario: [MADLRVP-15205] Verify LSFM - EmbeddedHTML output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15205.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportInput[@outputMode='EmbeddedHTML'] |

  @MADLRVP-15206
  Scenario: [MADLRVP-15206] Verify LSFM - EmbeddedHTMLAndPDF output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15206.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportInput[@outputMode='EmbeddedHTMLAndPDF'] |

  @MADLRVP-15207
  Scenario: [MADLRVP-15207] Verify LSFM - EmbeddedPDF output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15207.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportInput[@outputMode='EmbeddedPDF'] |

  @MADLRVP-15208
  Scenario: [MADLRVP-15208] Verify LSFM - HTMLHiddenFieldsOnly output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15208.xml
    When the LSFM request is sent
    Then response content type is HTML
    And the HTML response contains xpath
      | //div[@id='lsfm'] |
    And XML response contains hidden tags under the REPORTDELIM section
      | REPORT_NAME | LSFM    |
      | STATUS      | Y       |
      | STATUSTEXT  | SUCCESS |

  @MADLRVP-15209
  Scenario: [MADLRVP-15209] Verify LSFM - HTMLWithHiddenFields output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15209.xml
    When the LSFM request is sent
    Then response content type is HTML
    And the HTML response contains xpath
      | //div[@id='lsfm'] |
    And XML response contains hidden tags under the REPORTDELIM section
      | REPORT_NAME | LSFM    |
      | STATUS      | Y       |
      | STATUSTEXT  | SUCCESS |

  @MADLRVP-15210
  Scenario: [MADLRVP-15210] Verify LSFM - PDF output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15210.xml
    When the LSFM request is sent
    Then response content type is PDF
    And the PDF response has value
      | REPORT INFORMATION     |
      | LOAN INFORMATION       |
      | BORROWER INFORMATION   |
      | EMPLOYMENT INFORMATION |
      | FRAUD RISK SCORE:      |

  @MADLRVP-15211
  Scenario: [MADLRVP-15211] Verify LSFM - XMLWithEmbeddedHTML output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15211.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportInput[@outputMode='XMLWithEmbeddedHTML'] |

  @MADLRVP-15212
  Scenario: [MADLRVP-15212] Verify LSFM - XMLWithEmbeddedHTMLAndPDF output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15212.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportInput[@outputMode='XMLWithEmbeddedHTMLAndPDF'] |

  @MADLRVP-15213
  Scenario: [MADLRVP-15213] Verify LSFM - XMLWithEmbeddedHTMLWithHiddenFields output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15213.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportInput[@outputMode='XMLWithEmbeddedHTMLWithHiddenFields'] |
    And XML response contains hidden tags under the REPORTDELIM section
      | REPORT_NAME | LSFM    |
      | STATUS      | Y       |
      | STATUSTEXT  | SUCCESS |

  @MADLRVP-15214
  Scenario: [MADLRVP-15214] Verify LSFM - XMLWithEmbeddedPDF output mode
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15214.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportInput[@outputMode='XMLWithEmbeddedPDF'] |