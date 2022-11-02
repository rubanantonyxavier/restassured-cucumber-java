@api
@fcra
@lsrm
@section
@income
@employer_data_verification
Feature: LSRM FCRA - Income Detail Section - Employer Data Verification

  @MADLRVP-10441
  Scenario: [MADLRVP-10441] Verify LSRM FCRA - New combo alert INC_010 fires when INC_003, IDP_008, IDP_021 alerts fire
    Given the request XML filepath is /ript/fcra/lsrm/sections/income/MADLRVP-10441.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='IDP_008'] |
      | //Category/Flagged/Alert[@Id='IDP_021'] |
      | //Category/Flagged/Alert[@Id='INC_003'] |
      | //Category/Flagged/Alert[@Id='INC_010'] |
    And the response has xpath
      | XPath                                           | expected |
      | //Category/Flagged/Alert[@Id='IDP_008']/@Status | Y        |
      | //Category/Flagged/Alert[@Id='IDP_021']/@Status | Y        |
      | //Category/Flagged/Alert[@Id='INC_003']/@Status | Y        |
      | //Category/Flagged/Alert[@Id='INC_010']/@Status | Y        |

  @MADLRVP-10443
  Scenario Outline: [MADLRVP-10443] Verify LSRM FCRA - Verify that anchor tag is IV_EMP_DETAIL
    Given the request XML filepath is /ript/fcra/lsrm/sections/income/MADLRVP-10443.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT       |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>              |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                       |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                       |
      | //Alert[@Id='<alert_id>']/@Severity               | High                    |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                       |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_DETAIL           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_COMBO_INCOME_MISREP |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable              |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                   |
      | //Alert[@Id='<alert_id>']/@Category               | Income                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                 |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                       |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ARDMILLE, KELLY - Phone and employer information is unable to be verified or has multiple inconsistencies.
    """

    Examples:
      | alert_id |
      | INC_010  |

  @MADLRVP-10444
  Scenario: [MADLRVP-10444] Verify LSRM FCRA - Trigger tag is LSF_COMBO_INCOME_MISREP_ALERT
    Given the request XML filepath is /ript/fcra/lsrm/sections/income/MADLRVP-10444.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='INC_010'] |
    And the response has xpath
      | XPath                                                | expected                |
      | //Category/Flagged/Alert[@Id='INC_010']/@Status      | Y                       |
      | //Category/Flagged/Alert[@Id='INC_010']/@ExternalTag | LSF_COMBO_INCOME_MISREP |
    