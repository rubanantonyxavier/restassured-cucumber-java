@api
@non_fcra
@lsfm
@alerts
@fm
@income
Feature: LSFM FM Income Alerts

  @FM_001
  Scenario Outline: [FM_001] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_EMPNAME_SELF   |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
   # jennifer comments out   | //Alert[@Id='<alert_id>']/@Rescorable             | Y                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Employment type was not entered as self-employed, yet borrower name is similar to employer name
    """

    Examples:
      | alert_id |
      | FM_001   |

  @FM_002
  Scenario Outline: [FM_002] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_OCCYRS_VS_INC  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower professional years inconsistent with borrower income
    """

    Examples:
      | alert_id |
      | FM_002   |

  @FM_005
  Scenario Outline: [FM_005] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected           |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                  |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_EMPYEARS_VS_AGE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category               | Income             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower's age and time on job are inconsistent
    """

    Examples:
      | alert_id |
      | FM_005   |

  @FM_006
  Scenario Outline: [FM_006] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected               |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>             |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                      |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                      |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                    |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                      |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_EMPRISK_VS_EMPYEARS |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational          |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                  |
      | //Alert[@Id='<alert_id>']/@Category               | Income                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                      |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower's years at current job value is historically associated with high fraud risk
    """

    Examples:
      | alert_id |
      | FM_006   |

  @FM_018
  Scenario Outline: [FM_018] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_RISK_INC_DTI   |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower income and high DTI indicate potential fraud risk
    """

    Examples:
      | alert_id |
      | FM_018   |

  @FM_019
  Scenario Outline: [FM_019] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_INC_EMP_RISKY  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower income consistent with historical patterns of risk
    """

    Examples:
      | alert_id |
      | FM_019   |

  @FM_020
  Scenario Outline: [FM_020] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | High                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]             |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_INC_VS_PROPVALUE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Income              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    High borrower income and low property value
    """

    Examples:
      | alert_id |
      | FM_020   |

  @FM_021
  Scenario Outline: [FM_021] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | High                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NeighborhoodIncomeGraphAnchor |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_PURCH_HIGH_INC_LOW         |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Income                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower income in high ranges for geographic area of mailing address (non-owner occupied property)
    """

    Examples:
      | alert_id |
      | FM_021   |

  @FM_022
  Scenario Outline: [FM_022] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_INC_FITTING    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower's high income and DTI point to possible income fitting
    """

    Examples:
      | alert_id |
      | FM_022   |

  @FM_023
  Scenario Outline: [FM_023] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                        |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NeighborhoodIncomeGraphAnchor |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_HIGH_INC_GEO_AREA          |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Income                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower income in high ranges for geographic area of property address (non-owner occupied property)
    """

    Examples:
      | alert_id |
      | FM_023   |

  @FM_024
  Scenario Outline: [FM_024] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT     |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                     |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_HIGH_INC_AGE_RANGE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Income                |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower income is high relative to age range
    """

    Examples:
      | alert_id |
      | FM_024   |

  @FM_027
  Scenario Outline: [FM_027] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_DTI_RISK       |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower debt to income level is in high risk ranges
    """

    Examples:
      | alert_id |
      | FM_027   |

  @FM_028
  Scenario Outline: [FM_028] LSFM FM Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                    |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]              |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_INC_RISK_HISTORIC |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                |
      | //Alert[@Id='<alert_id>']/@Category               | Income               |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower income falls into high risk pattern historically
    """

    Examples:
      | alert_id |
      | FM_028   |

