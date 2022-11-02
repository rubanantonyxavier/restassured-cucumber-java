@api
@non_fcra
@lsrm
@alerts
@hp
@property
Feature: LSRM HP Property Alerts

  @HP_001
  Scenario Outline: [HP_001] LSRM HP Property Alert Validation
  Determine whether or not the Subject Property Address has a known "disaster"
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_DISASTER |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable            |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral            |
      | //Alert[@Id='<alert_id>']/@Category               | Property              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property is located in a zip code and county declared as a FEMA Disaster Area,
    with a disaster type that could impact property condition.
    """

    Examples:
      | alert_id |
      | HP_001   |

  @HP_002
  Scenario Outline: [HP_002] LSRM HP Property Alert Validation
  Based on county land use code
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_ANALYSIS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_RES    |
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
    Our records indicate that the subject property is not listed as residential
    """

    Examples:
      | alert_id |
      | HP_002   |

  @HP_018
  Scenario Outline: [HP_018] LSRM HP Property Alert Validation
  Based on county land use code
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                         |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                         |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                       |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                           |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                          |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL                |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | HP_SUBJ_FORECLOSURE_LAST_3_YEARS |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                    |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral                       |
      | //Alert[@Id='<alert_id>']/@Category               | Property                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                          |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property has foreclosure in last 3 years
    """

    Examples:
      | alert_id |
      | HP_018   |

  @HP_023
  Scenario Outline: [HP_023] LSRM HP Property Alert Validation
  Based on county land use code
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HUD_90DAY     |
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
    Subject property has sold or transferred with a value > 0 within the last 90 days
    """

    Examples:
      | alert_id |
      | HP_023   |

  @HP_036
  Scenario Outline: [HP_036] LSFM HP Property Alert Validation
  Property experienced a distressed event in the last 3 years (either notice of default or foreclosure)
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | DISTRESSED_EVENT  |
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
    Property experienced a distressed event in the last 3 years (either notice of default or foreclosure)
    """

    Examples:
      | alert_id |
      | HP_036   |