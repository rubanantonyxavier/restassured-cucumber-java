@api
@non_fcra
@lsfm
@alerts
@fm
@property
Feature: LSFM FM Property Alerts

  @FM_038
  Scenario Outline: [FM_038] LSFM FM Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                    |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS                   |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_PROPVALUE_HIGH_RANGE_VS_GEOGRAPHY |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                                |
      | //Alert[@Id='<alert_id>']/@Category               | Property                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property Value in higher ranges for geographic area
    """

    Examples:
      | alert_id |
      | FM_038   |

  @FM_040
  Scenario Outline: [FM_040] LSFM FM Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                 |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                 |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>               |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                        |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                        |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                      |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                  |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_PROPVALUE_HIGH_VS_AGE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational            |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                    |
      | //Alert[@Id='<alert_id>']/@Category               | Property                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                  |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                        |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property value inconsistent with borrower's age
    """

    Examples:
      | alert_id |
      | FM_040   |

  @FM_045
  Scenario Outline: [FM_045] LSFM FM Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                        |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                        |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                               |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                         |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS              |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_PROPVALUE_HIGH_SURROUND_AREA |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                   |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                           |
      | //Alert[@Id='<alert_id>']/@Category               | Property                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property value is high for surrounding area
    """

    Examples:
      | alert_id |
      | FM_045   |

  @FM_056
  Scenario Outline: [FM_056] LSFM FM Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | High                  |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_LN_AMT_INVEST_RISK |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Property              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Loan amount for investment property historically associated with risk
    """

    Examples:
      | alert_id |
      | FM_056   |

  @FM_061
  Scenario Outline: [FM_061] LSFM FM Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>              |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                       |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                       |
      | //Alert[@Id='<alert_id>']/@Severity               | High                    |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_PROPERTY_DETAIL      |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_AVM_STATE_VALUE_DIFF |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational           |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                   |
      | //Alert[@Id='<alert_id>']/@Category               | Property                |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                 |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                       |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Difference between stated property value and automated property valuation
    output associated with high historical fraud rate
    """

    Examples:
      | alert_id |
      | FM_061   |

