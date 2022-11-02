@api
@non_fcra
@lsrm
@alerts
@ls
@property
Feature: LSRM LS Property Alerts

  @LS_007
  Scenario Outline: [LS_007] LSRM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
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
  Scenario Outline: [LS_009] LSRM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
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

  @LS_016
  Scenario Outline: [LS_016] LSRM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
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
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                         |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    High market foreclosure rate
    """

    Examples:
      | alert_id |
      | LS_016   |

  @LS_018
  Scenario Outline: [LS_018] LSRM LS Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
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

