@api
@non_fcra
@lsfm
@section
@lqdm
Feature: LSFM - LQDM Result Section

  @MADLRVP-14060
  Scenario: [MADLRVP-14060] Verify LSFM - LQDM result section returned in xml response
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/lqdm/MADLRVP-14060.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers |
      | //ReportResults/LSFM/LQDMResults/vendor/@name     |

  @MADLRVP-14062
  Scenario: [MADLRVP-14062] Verify LSFM - LQDM result section returned Vendor information
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/lqdm/MADLRVP-14062.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/LQDMResults/vendor/@name            |
      | //ReportResults/LSFM/LQDMResults/vendor/@startMonitoring |
      | //ReportResults/LSFM/LQDMResults/vendor/@endMonitoring   |
    And the response has xpath
      | XPath                      | expected |
      | //LQDMResults/vendor/@name | Experian |

  @MADLRVP-14063
  Scenario: [MADLRVP-14063] Verify LSFM - LQDM result section returned Borrower Search Input information
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/lqdm/MADLRVP-14063.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/@firstName      |
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/@lastName       |
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/@maskedSSN      |
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/@encryptedSSN   |
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/@loanNumber     |
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/@currentAddress |
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/@borrowerNum    |
    And the response has xpath
      | XPath                                     | expected |
      | //LQDMResults/vendor/borrowers/@firstName | KEN      |
      | //LQDMResults/vendor/borrowers/@lastName  | CUSTOMER |

  @MADLRVP-14064
  Scenario: [MADLRVP-14064] Verify LSFM - LQDM result section returned Alert type - balanceChange, inquiry and new tradeline detail data
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/lqdm/MADLRVP-14064.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/alertTypes/creditors/events                    |
      | //LQDMResults//alertTypes[@name='balanceChange']//events[@alertType='Balance Increase Bankcard'] |
      | //LQDMResults//alertTypes[@name='inquiry']//events[@alertType='Installment Loan Inquiry']        |
      | //LQDMResults//alertTypes[@name='new tradeline']//events[@alertType='New Auto Loan']             |

  @MADLRVP-14065
  Scenario: [MADLRVP-14065] Verify LSFM - LQDM result section returned Alert type - dlq60Days and dlq120Days detail data
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/lqdm/MADLRVP-14065.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/LQDMResults/vendor/borrowers/alertTypes/creditors/events                         |
      | //LQDMResults//alertTypes[@name='dlq60Days']//events[@alertType='Grid Code 2 (60 Days Delinquent)']   |
      | //LQDMResults//alertTypes[@name='dlq120Days']//events[@alertType='Grid Code 4 (120 Days Delinquent)'] |

  @MADLRVP-14068
  @hidden_tags
  Scenario: [MADLRVP-14068] Verify LSFM - LQDM attributes are added in Hidden Tags section
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/lqdm/MADLRVP-14068.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/XMLHiddenTags/NameValueData                  |
      | //XMLHiddenTags/NameValueData[@name='START_MONITORING0']          |
      | //XMLHiddenTags/NameValueData[@name='END_MONITORING0']            |
      | //XMLHiddenTags/NameValueData[@name='VENDOR00']                   |
      | //XMLHiddenTags/NameValueData[@name='ALERT_TYPE00']               |
      | //XMLHiddenTags/NameValueData[@name='ALERT_DATE00']               |
      | //XMLHiddenTags/NameValueData[@name='CREDITOR_NAME00']            |
      | //XMLHiddenTags/NameValueData[@name='CREDITOR_PHONE00']           |
      | //XMLHiddenTags/NameValueData[@name='INDUSTRY00']                 |
      | //XMLHiddenTags/NameValueData[@name='LOAN_AMOUNT00']              |
      | //XMLHiddenTags/NameValueData[@name='DATE_OPENED00']              |
      | //XMLHiddenTags/NameValueData[@name='NEW_TRADE_OPEN_DATE00']      |
      | //XMLHiddenTags/NameValueData[@name='NEW_TRADE_BALANCE_AMOUNT00'] |
      | //XMLHiddenTags/NameValueData[@name='PAYMENT00']                  |
      | //XMLHiddenTags/NameValueData[@name='LQDM_SSN00']                 |