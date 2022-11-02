@api
@non_fcra
@lsfm
@alerts
@fm
@borrower
Feature: LSFM FM Borrower Alerts

  @FM_031
  Scenario Outline: [FM_031] LSFM FM Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                       |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                      |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_OO_LOW_OCC_RATE           |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Occupancy risk: risky potential non-owner occupied
    """

    Examples:
      | alert_id |
      | FM_031   |

  @FM_034
  Scenario Outline: [FM_034] LSFM FM Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                       |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                      |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_INVEST_SCHEMES            |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property or mailing address located in an area with an elevated fraud rate
    """

    Examples:
      | alert_id |
      | FM_034   |

  @FM_035
  Scenario Outline: [FM_035] LSFM FM Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                       |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_ADDRESS_SUMMARY          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_OO_MAIL_ADDR_FAR          |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Occupancy risk. Mailing address is far from subject property for a primary residence, refinance transaction.
    """

    Examples:
      | alert_id |
      | FM_035   |

  @FM_037
  Scenario Outline: [FM_037] LSFM FM Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_SITEMAP               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_PROP_DIST_EMPPHONE        |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Work phone is a significant distance from property
    """

    Examples:
      | alert_id |
      | FM_037   |

  @FM_051
  Scenario Outline: [FM_051] LSFM FM Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                      |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_CMB_LS_ALERTS             |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower has indicated first-time homebuyer status,
    yet appears to already own one or more properties
    """

    Examples:
      | alert_id |
      | FM_051   |

  @FM_064 @ignore
  Scenario Outline: [FM_064] LSFM FM Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                      |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_CMB_LS_ALERTS             |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower has indicated first-time homebuyer status,
    yet appears to already own one or more properties
    """

    Examples:
      | alert_id |
      | FM_064   |

  @FM_066
  Scenario Outline: [FM_066] LSFM FM Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                          |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High                              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_HIGH_RISK_PURCHASE_TRANSACTION |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                             |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Purchase transaction with multiple high risk factors
    """

    Examples:
      | alert_id |
      | FM_066   |