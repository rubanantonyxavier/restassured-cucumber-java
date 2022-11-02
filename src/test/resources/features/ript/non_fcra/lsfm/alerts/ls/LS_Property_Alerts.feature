@api
@non_fcra
@lsfm
@alerts
@ls
@property
Feature: LSFM LS Property Alerts

  @LS_003
  Scenario Outline: [LS_003] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High                              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | TPSC_MARKET_DETAIL                |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MARKET_LONG_TERM_DEPRECIATION |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                     |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral                        |
      | //Alert[@Id='<alert_id>']/@Category               | Property                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Market has experienced long term (12 month) depreciation
    """

    Examples:
      | alert_id |
      | LS_003   |

  @LS_004
  Scenario Outline: [LS_004] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                        |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                       |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUBJ_VALUE_OUTSIDE_MARKET |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Property                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property Value in higher ranges for geographic area
    """

    Examples:
      | alert_id |
      | LS_004   |

  @LS_005
  Scenario Outline: [LS_005] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_AREA_MAP         |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_NEAR_INTERSTATE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral          |
      | //Alert[@Id='<alert_id>']/@Category               | Property            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property close to interstate
    """

    Examples:
      | alert_id |
      | LS_005   |

  @LS_006
  Scenario Outline: [LS_006] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_AREA_MAP         |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_NEAR_MAJOR_ROAD |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral          |
      | //Alert[@Id='<alert_id>']/@Category               | Property            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property close to major road
    """

    Examples:
      | alert_id |
      | LS_006   |

  @LS_007
  Scenario Outline: [LS_007] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_ANALYSIS  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_LAND_USE_UNKNOWN |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral           |
      | //Alert[@Id='<alert_id>']/@Category               | Property             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Land use is unknown
    """

    Examples:
      | alert_id |
      | LS_007   |

  @LS_009
  Scenario Outline: [LS_009] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_AREA_MAP       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_NEAR_RAILROAD |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral        |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property close to rail line
    """

    Examples:
      | alert_id |
      | LS_009   |

  @LS_011
  Scenario Outline: [LS_011] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Severity               | High                     |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                  |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_NOD_ACTIVITY_SUBJECT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational            |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral               |
      | //Alert[@Id='<alert_id>']/@Category               | Property                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                  |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                        |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Recent notice of default associated to subject property
    """

    Examples:
      | alert_id |
      | LS_011   |

  @LS_012
  Scenario Outline: [LS_012] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_BUYER_SELLER     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_LENDER_ACTIVITY |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Property            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Unusually high number of private lenders in nearby sales histories
    """

    Examples:
      | alert_id |
      | LS_012   |

  @LS_013
  Scenario Outline: [LS_013] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                  |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                         |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                         |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                    |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                   |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_NEARBY_SALES           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BUYER_SELLER_ACTIVITY |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational             |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                     |
      | //Alert[@Id='<alert_id>']/@Category               | Property                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                   |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                         |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Unusually high number of corporate/LLC sellers in nearby sales histories
    """

    Examples:
      | alert_id |
      | LS_013   |

  @LS_014
  Scenario Outline: [LS_014] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                    |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                  |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                           |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                           |
      | //Alert[@Id='<alert_id>']/@Severity               | High                        |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                     |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                     |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_PROPERTY_DETAIL          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUBJ_RAPID_APPRECIATION |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational               |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                       |
      | //Alert[@Id='<alert_id>']/@Category               | Property                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                     |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                           |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Appreciation between current value and last sale of
    subject property is high compared to market values
    """

    Examples:
      | alert_id |
      | LS_014   |

  @LS_016
  Scenario Outline: [LS_016] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                  |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                         |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                         |
      | //Alert[@Id='<alert_id>']/@Severity               | High                      |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                   |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HIGH_FORECLOSURE_RATE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational             |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral                |
      | //Alert[@Id='<alert_id>']/@Category               | Property                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                   |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                         |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    High market foreclosure rate
    """

    Examples:
      | alert_id |
      | LS_016   |

  @LS_017
  Scenario Outline: [LS_017] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@AnchorTag              | TPSC_MARKET_DETAIL      |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_INCONSISTENT_MARKET |
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
    Possible property flipping conditions in market
    high foreclosure activity and rising house prices
    """

    Examples:
      | alert_id |
      | LS_017   |

  @LS_018
  Scenario Outline: [LS_018] LSFM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/ls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']            |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                        |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                       |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MODERATE_FORECLOSURE_RATE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral                    |
      | //Alert[@Id='<alert_id>']/@Category               | Property                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Moderately high market foreclosure rate
    """

    Examples:
      | alert_id |
      | LS_018   |

